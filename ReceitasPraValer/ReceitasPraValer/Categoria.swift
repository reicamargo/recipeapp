//
//  Categoria.swift
//  ReceitasPraValer
//
//  Created by Reinaldo B Camargo on 24/05/16.
//  Copyright © 2016 Reinaldo B Camargo. All rights reserved.
//

import UIKit

class Categoria: NSObject {
    var title: String
    var ativo: Bool
    
    init(title: String, ativo: Bool) {
        self.title = title
        self.ativo = ativo
    }
}
