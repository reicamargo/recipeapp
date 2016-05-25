//
//  RestApiManager.swift
//  ReceitasPraValer
//
//  Created by Reinaldo B Camargo on 23/05/16.
//  Copyright © 2016 Reinaldo B Camargo. All rights reserved.
//

import Foundation

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestApiManager: NSObject {
    
    let baseURL = "http://webapireceitas.azurewebsites.net/api/"
    
    func makeHTTPGetRequest(endPointUrl: String, onCompletion: ServiceResponse) {
        
        let path = baseURL + endPointUrl
        let request = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(request!, completionHandler: { data, response, error in
            let json:JSON = JSON(data:data!)
            //let jsonNative = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) catch error
            onCompletion(json, error)
        })
        
        task.resume()
        
        
    }
}
