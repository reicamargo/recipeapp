//
//  ListaReceitaViewController.swift
//  ReceitasPraValer
//
//  Created by Reinaldo B Camargo on 24/05/16.
//  Copyright © 2016 Reinaldo B Camargo. All rights reserved.
//

import UIKit

class ListaReceitaViewController: UITableViewController {

    var choosenCategory: Categoria?
    var recipes = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoriaManager.sharedInstance.getCategoria((choosenCategory?.id)!) { json -> Void in
            let receitas = json["Receitas"]
            for (_, receita) in receitas {
                let recipe: AnyObject = receita.object
                self.recipes.addObject(recipe)
            }
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        self.title = choosenCategory?.title
        super.viewDidAppear(animated)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipeCell") as! RecipeTableViewCell
        
        let recipe:JSON = JSON(self.recipes[indexPath.row])
        
        cell.recipe = Recipe(id: recipe["Id"].int32Value, idCategory: recipe["CategoriaID"].int32Value,
                             title: recipe["Titulo"].string!, ingredients: recipe["Ingredientes"].string!,
                             preparationSteps: recipe["ModoPreparo"].string!, ativo: recipe["Ativo"].boolValue)
        cell.textLabel?.text = recipe["Titulo"].string
        
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "recipeDetailView"){
            let cell = sender as! RecipeTableViewCell
            let recipeDetailView = segue.destinationViewController as! RecipeDetailViewController
            
            recipeDetailView.choosenRecipe = cell.recipe
            
        }
    }
}
