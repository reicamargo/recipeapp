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
    
    func makeHTTPPostRequest(endPointUrl: String, body: AnyObject, onCompletion: ServiceResponse) {
        var err: NSError?
        let path = baseURL + endPointUrl
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // Set the method to POST
        request.HTTPMethod = "POST"
        
        // Set the POST body for the request
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(body, options: NSJSONWritingOptions.PrettyPrinted)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            let json:JSON = JSON(data: data!)
            onCompletion(json, err)
        })
        task.resume()
    }
}

