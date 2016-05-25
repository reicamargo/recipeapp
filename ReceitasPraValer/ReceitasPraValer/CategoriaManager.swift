//
//  CategoriaManager.swift
//  ReceitasPraValer
//
//  Created by Reinaldo B Camargo on 23/05/16.
//  Copyright © 2016 Reinaldo B Camargo. All rights reserved.
//

import Foundation

class CategoriaManager: NSObject {
    static let sharedInstance = CategoriaManager()
    var endPointUrl = "categoria/"
    var restApiManager = RestApiManager()
    
    func getCategorias(onCompletion: (JSON) -> Void) {
    
        restApiManager.makeHTTPGetRequest(endPointUrl, onCompletion: { json, err -> Void in
            onCompletion(json)
        
        })
    
    }

}