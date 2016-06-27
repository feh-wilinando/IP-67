//
//  FormularioViewController.swift
//  ContatosApp
//
//  Created by Fernando on 06/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import UIKit

class FormularioViewController: UIViewController {

    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var enderecoTextiField: UITextField!
    @IBOutlet weak var siteTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var contato:Contato?
    let dao = ContatoDAO.sharedInstance()
    var delegate:FormularioContatoViewControllerDelegation?
    
    override func viewDidLoad() {
        colocaContatoNoFormulario()
        
        if contato != nil {
            addButton.enabled = false
            
            let alterarButton = UIBarButtonItem(title: "Alterar", style: .Plain, target: self, action:#selector(FormularioViewController.atualizaContato))
            
            self.navigationItem.rightBarButtonItem = alterarButton
            
        }
        
    }

    @IBAction func gravar(sender: AnyObject) {
        adicionaContato()
    }
    
    
    private func pegaContatoDoFormulario()  {
        
        if contato == nil {
            contato = Contato()
        }
        
        self.contato?.nome = nomeTextField.text
        self.contato?.telefone = telefoneTextField.text
        self.contato?.endereco = enderecoTextiField.text
        self.contato?.site = siteTextField.text
    }
    
    private func colocaContatoNoFormulario(){
        nomeTextField.text = contato?.nome
        telefoneTextField.text = contato?.telefone
        enderecoTextiField.text = contato?.endereco
        siteTextField.text = contato?.site
    }
    
    func atualizaContato(){
        pegaContatoDoFormulario()
        
        if delegate != nil {
            delegate?.contatoAtualizado(contato!)
        }
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    func adicionaContato(){
        pegaContatoDoFormulario()
        dao.add(self.contato!)
        
        if delegate != nil {
            delegate?.contatoAdicionado(contato!)
        }
        
        navigationController?.popViewControllerAnimated(true)
    }
    
}
