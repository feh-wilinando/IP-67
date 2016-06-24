//
//  ListagemTableViewController.swift
//  ContatosApp
//
//  Created by Fernando on 06/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import UIKit

class ListagemTableViewController: UITableViewController {
    
    static private let cellIdendifier = "celulaContato"
    static private let formContatoIdendifier = "Form-Contato"
    
    
    let dao = ContatoDAO.sharedInstance()
    var contatoSelecionado:Contato?
    
    
    override func viewDidLoad() {
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dao.list().count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ListagemTableViewController.cellIdendifier, forIndexPath: indexPath)
        
        let contato = dao.findById(indexPath.row)
        
        cell.textLabel?.text = contato.nome
        
        return cell
        
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            dao.remove(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
        
    }
            
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.contatoSelecionado = dao.findById(indexPath.row)
        exibeFormulario()
    }
    
    
    
    private func exibeFormulario(){
        let form: FormularioViewController  = (storyboard?.instantiateViewControllerWithIdentifier(ListagemTableViewController.formContatoIdendifier) as! FormularioViewController)
        
        form.contato = self.contatoSelecionado
        
        navigationController?.pushViewController(form, animated: true)
        
    }
    
}
