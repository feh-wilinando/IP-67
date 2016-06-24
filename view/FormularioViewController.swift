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
    
    var contato = Contato()
    let dao = ContatoDAO.sharedInstance()
    

    @IBAction func gravar(sender: AnyObject) {
        pegaContatoDoFormulario()
        dao.add(self.contato)
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    func pegaContatoDoFormulario()  {
        self.contato = Contato(nome: nomeTextField.text,
                               telefone: telefoneTextField.text,
                               endereco: enderecoTextiField.text,
                               site: siteTextField.text)
    }
    
    
}
