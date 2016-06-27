//
//  ListagemTableViewController.swift
//  ContatosApp
//
//  Created by Fernando on 06/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import UIKit

class ListagemTableViewController: UITableViewController,FormularioContatoViewControllerDelegation {
    
    static private let cellIdendifier = "celulaContato"
    static private let formContatoIdendifier = "Form-Contato"
    
    
    let dao = ContatoDAO.sharedInstance()
    var contatoSelecionado:Contato?
    var linhaSelecionada:Int?
    var gerenciador: GerenciadorDeAcoes?
    
    
    @IBAction func exibeMaisAcoes(gesture: UILongPressGestureRecognizer) {
        
        if gesture.state == UIGestureRecognizerState.Began {
         
            let point: CGPoint = gesture.locationInView(self.tableView)
            let indexPath: NSIndexPath? = self.tableView.indexPathForRowAtPoint(point)
            
            self.contatoSelecionado = dao.findById(indexPath!.row)
            
            if contatoSelecionado != nil {
                gerenciador = GerenciadorDeAcoes(withContato: self.contatoSelecionado!)
                gerenciador?.acoesDoController(self)
            }
            
            
            
            
        }
        
    }
    
    override func viewDidLoad() {
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if linhaSelecionada != nil {
        
            let indexPath:NSIndexPath? = NSIndexPath(forRow: linhaSelecionada!, inSection: 0)
        
            self.tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition:UITableViewScrollPosition.Middle)
            
            linhaSelecionada = nil
        }
        
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
        form.delegate = self
        navigationController?.pushViewController(form, animated: true)
        
    }
    
    
    
    //MARK: Delegates<FormularioContatoViewControllerDelegate>
    func contatoAdicionado(contato: Contato) {
        print(contato)
    }
    
    func contatoAtualizado(contato: Contato) {
        
        self.linhaSelecionada =  dao.getIdFrom(contato)
        
        print(contato)
    }
    
}
