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
        
    let dao = ContatoDAO.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gravar(sender: AnyObject) {
        
        print("método gravar IBAction")
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!){
        let contato : Contato = Contato(nome: nomeTextField.text,
                                        telefone: telefoneTextField.text,
                                        endereco: enderecoTextiField.text,
                                        site: siteTextField.text)
        
        print(contato)
        
        
        dao.add(contato)
    }
    
    
}
