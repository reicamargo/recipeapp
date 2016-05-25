//
//  ListaReceitaViewController.swift
//  ReceitasPraValer
//
//  Created by Reinaldo B Camargo on 24/05/16.
//  Copyright © 2016 Reinaldo B Camargo. All rights reserved.
//

import UIKit

class ListaReceitaViewController: UITableViewController {

    var preCategory: Categoria?
    var items = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        self.title = preCategory?.title
        super.viewDidAppear(animated)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipeCell") as! CategoryTableViewCell
        
        return cell
        
    }
}
