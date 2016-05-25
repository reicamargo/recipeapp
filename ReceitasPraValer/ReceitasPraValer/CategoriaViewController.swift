//
//  CategoriaViewController.swift
//  ReceitasPraValer
//
//  Created by Reinaldo B Camargo on 23/05/16.
//  Copyright © 2016 Reinaldo B Camargo. All rights reserved.
//

import UIKit

class CategoriaViewController: UITableViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var items = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()
        CategoriaManager.sharedInstance.getCategorias { json -> Void in
            
            for (_, catego) in json {
                let categoria: AnyObject = catego.object
                self.items.addObject(categoria)
            }
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            })
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCell") as! CategoryTableViewCell
        
        let categoria:JSON = JSON(self.items[indexPath.row])

        cell.category = Categoria(title: categoria["Titulo"].string!, ativo: categoria["Ativo"].boolValue)
        cell.textLabel?.text = categoria["Titulo"].string
        
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "listaReceitaView"){
            let cell = sender as! CategoryTableViewCell
            let listaReceitaView = segue.destinationViewController as! ListaReceitaViewController
            
            listaReceitaView.preCategory = cell.category
            
        }
    }

}
