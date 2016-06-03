//
//  RecipeViewController.swift
//  ReceitasPraValer
//
//  Created by Reinaldo B Camargo on 5/30/16.
//  Copyright © 2016 Reinaldo B Camargo. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    var choosenRecipe: Recipe?
    
    @IBOutlet weak var txtIngredientes: UITextView!
    @IBOutlet weak var txtModoPreparo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtIngredientes.text = choosenRecipe?.ingredients
        txtModoPreparo.text = choosenRecipe?.preparationSteps
        self.title = choosenRecipe?.title
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
