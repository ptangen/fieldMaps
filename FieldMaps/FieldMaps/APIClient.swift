//
//  APIClient.swift
//  FieldMaps
//
//  Created by Paul Tangen on 2/9/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

import Foundation

class APIClient {
    
    class func getLocationJSON(address:String, completion:@escaping ([String:Any]?)->Void) {
        if let addressEncoded = address.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            let urlString = "https://maps.googleapis.com/maps/api/geocode/json?address=\(addressEncoded)&key=\(Secrets.apiKey)"
            let url = URL(string: urlString)
            if let unwrappedURL = url {
                let session = URLSession.shared
                let datatask = session.dataTask(with: unwrappedURL) { (data, response, error) in
                    guard let unwrappedData = data else { return }
                    do {
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String:Any]
                        completion(responseJSON)
                    } catch {
                        print("error getting coordinates")
                    }
                }
                datatask.resume()
            }
        }
    }
}
