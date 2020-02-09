//
//  APIManager.swift
//  SlackAlerts
//
//  Created by Kunal Gupta on 03/02/20.
//  Copyright © 2020 Kunal Gupta. All rights reserved.
//

import Foundation

struct APIManager {

    static func postToSlack(_ strURL: String,_ attachments: JSON) {
        
        var request = URLRequest(url: URL(string: strURL)!)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: attachments, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
    
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { _, _, _ in })
        task.resume()
    }
}
