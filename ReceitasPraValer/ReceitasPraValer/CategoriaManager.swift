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
    var endPointUrl = "categorias/"
    var restApiManager = RestApiManager()
    
    func getCategorias(onCompletion: (JSON) -> Void) {
    
        restApiManager.makeHTTPGetRequest(endPointUrl, onCompletion: { json, err -> Void in
            onCompletion(json)
        
        })
    
    }
    
    func getCategoria(idCategoria: Int32, onCompletion: (JSON) -> Void) {
        endPointUrl = endPointUrl + String(idCategoria)
        restApiManager.makeHTTPGetRequest(endPointUrl, onCompletion: { json, err -> Void in
            onCompletion(json)
            
        })
        
    }
    
    func addCategoria(categoria: Categoria, onCompletion: (JSON) -> Void) {
        //let dic = categoria.toDict()
        //let json = try? NSJSONSerialization.dataWithJSONObject(dic, options: NSJSONWritingOptions.PrettyPrinted)
        
        //restApiManager.makeHTTPPostRequest(endPointUrl, body: dic, onCompletion: { json, err -> Void in
        //    onCompletion(json)
            
        //})
        
    }

}