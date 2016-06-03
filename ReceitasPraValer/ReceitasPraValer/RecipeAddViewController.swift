//
//  RecipeAddViewController.swift
//  ReceitasPraValer
//
//  Created by Reinaldo B Camargo on 5/30/16.
//  Copyright © 2016 Reinaldo B Camargo. All rights reserved.
//

import UIKit

class RecipeAddViewController: UIViewController {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAdicionar_click(sender: AnyObject) {
        if let nomeCategoria = titleText.text {
            let categoria = Categoria(title: nomeCategoria, ativo: true)
            
            CategoriaManager.sharedInstance.addCategoria(categoria) { json -> Void in
                  print(json)
//                let receitas = json["Receitas"]
//                for (_, receita) in receitas {
//                    let recipe: AnyObject = receita.object
//                    self.recipes.addObject(recipe)
//                }
                dispatch_async(dispatch_get_main_queue(), {
                    self.titleText.text = ""
                    print(json)
                })
            }
        }
    }
    
    @IBAction func doneButton_click(sender: AnyObject) {
        titleText.resignFirstResponder()
    }
    
    
}
