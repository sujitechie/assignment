//
//  DataFactory.swift
//  assignment
//
//  Created by Sujith Peeka on 24/04/20.
//  Copyright © 2020 Sujith Peeka. All rights reserved.
//

import Foundation

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

    private func makeWebRequest(url: String, completionHandler: @escaping (Data?, CustomError?) -> Void) {
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if let httpResponse = response as? HTTPURLResponse {
                if  httpResponse.statusCode == 200 {
                    guard let data = data else {
                        let error = CustomError(code: httpResponse.statusCode, description: error?.localizedDescription ?? "Error Occured")
                        completionHandler(nil, error)
                        return
                    }
                    do {
                        //guard let utf8Data = String(decoding: data, as: UTF8.self).data(using: .utf8) else { return }
                        //let jsonResponse =  try JSONSerialization.jsonObject(with: utf8Data, options: .mutableContainers)
                        completionHandler(data, nil)
                    } catch {
                        let error = CustomError(code: httpResponse.statusCode, description: error.localizedDescription )
                        completionHandler(nil, error)
                    }
                } else {
                    let error = CustomError(code: httpResponse.statusCode, description: "")
                    completionHandler(nil, error)
                }
            }
        })
        task.resume()
    }
}
