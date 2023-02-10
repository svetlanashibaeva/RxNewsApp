//
//  ApiService.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 09.02.2023.
//

import Foundation
import ObjectMapper

class ApiService {
    
    func requestItems<T: BaseMappable>(with endpoint: EndpointProtocol, responseKey: String? = nil, completion: @escaping (Result<[T], Error>) -> ()) {
        request(with: endpoint) { json, error in

            if let error = error {
                return completion(.failure(error))
            }
            
            let objects: Any?
            
            if let responseKey = responseKey {
                let json = (json as? [String : Any]) ?? [:]
                objects = json[responseKey]
            } else {
                objects = json
            }
            
            if let parsedObject = Mapper<T>(context: nil).mapArray(JSONObject: objects) {
                completion(.success(parsedObject))
            } else {
                completion(.failure(MyError.parseError))
            }
        }
    }
    
    private func request(with endpoint: EndpointProtocol, completion: @escaping (Any?, Error?) -> ()) {
        guard let url = buildUrl(with: endpoint) else {
            return completion(nil, MyError.urlError)
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data = data {
                let JSON = try? JSONSerialization.jsonObject(
                    with: data,
                    options: .allowFragments
                )
                if let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) {
                    completion(JSON, nil)
                } else {
                    guard let apiError = Mapper<ApiError>(context: nil).map(JSONObject: JSON) else {
                        return completion(nil, MyError.unknownError)
                    }
                    completion(nil, MyError.customError(error: apiError.message))
                }
            }
        }.resume()
    }
    
    private func buildUrl(with endpoint: EndpointProtocol) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.params.map {
            URLQueryItem(name: $0, value: $1)
        }
        
        return urlComponents.url
    }
}

