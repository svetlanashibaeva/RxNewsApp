//
//  WebImageView.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 21.02.2023.
//

import UIKit

class WebImageView: UIImageView {
    
    private var urlString: String?
    
    func set(imageURL: String?) {
        urlString = imageURL
        guard let imageURL = imageURL, let url = URL(string: imageURL) else {
            image = nil
            return
        }
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            image = UIImage(data: cachedResponse.data)
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.handleLoadedImage(data: data, response: response)
                }
            }
        }.resume()
    }
    
    private func handleLoadedImage(data: Data, response: URLResponse) {
        guard let responseUrl = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseUrl))
        
        if responseUrl.absoluteString == urlString {
            image = UIImage(data: data)
        }
    }
}
