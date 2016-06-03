//
//  ReceitaManager.swift
//  ReceitasPraValer
//
//  Created by Reinaldo B Camargo on 5/25/16.
//  Copyright © 2016 Reinaldo B Camargo. All rights reserved.
//

import Foundation

class ReceitaManager: NSObject {
    static let sharedInstance = ReceitaManager()
    var endPointUrl = "receitas/"
    var restApiManager = RestApiManager()
    
    func getReceitas(onCompletion: (JSON) -> Void) {
        
        restApiManager.makeHTTPGetRequest(endPointUrl, onCompletion: { json, err -> Void in
            onCompletion(json)
            
        })
        
    }
    
}