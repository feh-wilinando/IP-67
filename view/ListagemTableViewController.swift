//
//  ListagemTableViewController.swift
//  ContatosApp
//
//  Created by Fernando on 06/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import UIKit

class ListagemTableViewController: UITableViewController {
    
    
    var dao = ContatoDAO.sharedInstance()
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dao.list().count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("celulaContato", forIndexPath: indexPath)
        
        cell.textLabel?.text = dao.findById(indexPath.row).nome
        
        return cell
        
    }
    
}
