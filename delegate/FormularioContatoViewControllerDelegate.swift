//
//  FormularioContatoViewControllerDelegate.swift
//  ContatosApp
//
//  Created by Fernando on 24/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import Foundation

protocol FormularioContatoViewControllerDelegation {
    
    func contatoAdicionado(contato: Contato)
    func contatoAtualizado(contato: Contato)
}