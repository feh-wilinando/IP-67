//
//  ContatoDAO.swift
//  ContatosApp
//
//  Created by Fernando on 06/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import UIKit
import CoreData


class ContatoDAO: CoreDataUtil {
    static internal var defaultDAO: ContatoDAO!
    var contatos: Array<Contato> = Array()        
    
    
    override private init(){}
    
    static func sharedInstance() -> ContatoDAO{
        
        if ContatoDAO.defaultDAO == nil {
            ContatoDAO.defaultDAO = ContatoDAO()
            ContatoDAO.defaultDAO.inserirDadosIniciais()
            ContatoDAO.defaultDAO.carregarContatos()
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
    
    
    func getIdFrom(contato: Contato)->Int{
        return self.contatos.indexOf(contato)!
    }
    
    
    func carregarContatos(){
        let buscaContatos = NSFetchRequest(entityName: "Contato")
        
        let ordem = NSSortDescriptor(key: "nome", ascending: true)
        
        buscaContatos.sortDescriptors = [ordem]
        
        do {
            let result = try self.managedObjectContext.executeFetchRequest(buscaContatos)  as! [Contato]
            self.contatos = result
        }catch let error as NSError{
            print("Fetch falhou: \(error.localizedDescription) ")
        }
    }
    
    
    func inserirDadosIniciais(){
        let configuracoes = NSUserDefaults.standardUserDefaults()
        let dadosInseridos = configuracoes.boolForKey("dados_inseridos")
        
        
        if !dadosInseridos {
            
            let contatoCaelum: Contato = NSEntityDescription.insertNewObjectForEntityForName("Contato", inManagedObjectContext: self.managedObjectContext) as! Contato
            
            
            contatoCaelum.nome = "Caelum Unidade São Paulo"
            contatoCaelum.endereco = "São Paulo, SP, Rua Vergueiro, 3185"
            contatoCaelum.telefone = "01155712751"
            contatoCaelum.site = "www.caelum.com.br"
            contatoCaelum.latitude = -23.5883034
            contatoCaelum.longitude = -46.632369
            
            self.saveContext()
            
            configuracoes.setBool(true, forKey: "dados_inseridos")
            configuracoes.synchronize()
            
            
        }
        
    }
    
    
    
    func novoContato() -> Contato {
        return NSEntityDescription.insertNewObjectForEntityForName("Contato", inManagedObjectContext: self.managedObjectContext) as! Contato
    }
    
    
    
}
