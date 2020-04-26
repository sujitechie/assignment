//
//  DataFactory.swift
//  assignment
//
//  Created by Sujith Peeka on 24/04/20.
//  Copyright © 2020 Sujith Peeka. All rights reserved.
//

import Foundation
import UIKit

class DataFactory: NSObject {
    let data = "hello there"

    func getFacts(url: String, completionHandler: @escaping (HomeScreen?, CustomError?) -> Void) {
        makeWebRequest(url: url) { (data, error) in
            if let error = error {
                completionHandler(nil, error)
            } else {
                guard let homeData = data else { return }
                do {
                    guard let utf8Data = String(decoding: homeData, as: UTF8.self).data(using: .utf8) else { return }
                    let homeScreenData = try JSONDecoder().decode(HomeScreen.self, from: utf8Data)
                    completionHandler(homeScreenData, nil)
                } catch let err {
                    let error = CustomError(code: 0, description: err.localizedDescription)
                    completionHandler(nil, error)
                }
            }
        }

    }
    func downloadImageFromURL(imageUrl: String, completionHandler: @escaping (UIImage?, CustomError?) -> Void) {
        makeWebRequest(url: imageUrl) { (data, error) in
            if let error = error {
                completionHandler(nil, error)
            } else {
                guard let imageData = data else {
                    let error = CustomError(code: 0, description: "Something went wrong")
                    completionHandler(nil, error)
                    return
                }
                let image = UIImage(data: imageData)
                completionHandler(image, nil)
            }
        }
    }

    private func makeWebRequest(url: String, completionHandler: @escaping (Data?, CustomError?) -> Void) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if let httpResponse = response as? HTTPURLResponse {
                if  httpResponse.statusCode == 200 {
                    guard let data = data else {
                        let error = CustomError(code: httpResponse.statusCode, description: error?.localizedDescription ?? "Error Occured")
                        completionHandler(nil, error)
                        return
                    }
                    completionHandler(data, nil)
                } else {
                    let error = CustomError(code: httpResponse.statusCode, description: "")
                    completionHandler(nil, error)
                }
            }
        })
        task.resume()
    }
}
