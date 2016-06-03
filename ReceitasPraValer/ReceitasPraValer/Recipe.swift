//
//  Recipe.swift
//  ReceitasPraValer
//
//  Created by Reinaldo B Camargo on 5/30/16.
//  Copyright © 2016 Reinaldo B Camargo. All rights reserved.
//

import UIKit

class Recipe: NSObject {
    var id: Int32
    var idCategory: Int32
    var title: String
    var ingredients: String
    var preparationSteps: String
    var ativo: Bool
    
    init(id: Int32, idCategory: Int32, title: String, ingredients: String,
         preparationSteps:String, ativo: Bool) {
        self.id = id
        self.idCategory = idCategory
        self.title = title
        self.ingredients = ingredients
        self.preparationSteps = preparationSteps
        self.ativo = ativo
    }
}
