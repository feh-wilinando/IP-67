//
//  ContatoDAO.swift
//  ContatosApp
//
//  Created by Fernando on 06/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import UIKit

class ContatoDAO: NSObject {
    static internal var defaultDAO: ContatoDAO!;
    var contatos: Array<Contato> = Array()
    
    
    override private init(){}
    
    static func sharedInstance() -> ContatoDAO{
        if ContatoDAO.defaultDAO == nil {
            ContatoDAO.defaultDAO = ContatoDAO()
        }
        
        return ContatoDAO.defaultDAO
    }
    
    func add(contato:Contato){
        self.contatos.append(contato)
    }
    
    func list() -> Array<Contato> {
        return self.contatos
    }
    
    func findById(id: Int) -> Contato{
        return self.contatos[id]
    }
    
    func remove(id: Int){
        self.contatos.removeAtIndex(id)
    }
}
