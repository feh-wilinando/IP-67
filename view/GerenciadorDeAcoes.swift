//
//  GerenciadorDeAcoes.swift
//  ContatosApp
//
//  Created by Fernando on 24/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import Foundation
import UIKit

class GerenciadorDeAcoes: NSObject {
    
    let contato:Contato
    var controller: UIViewController?
    
    init(withContato contato:Contato) {
        self.contato = contato
    }
    
    
    func acoesDoController(controller: UIViewController){
        self.controller = controller

        let opcoes = UIAlertController(title: contato.nome, message: nil, preferredStyle: .ActionSheet)
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .Cancel, handler: nil)
        
        let ligar = UIAlertAction(title: "Ligar", style: .Default){(action) in
            self.ligar()
        }
        
        
        let abrirSite = UIAlertAction(title: "Visualizar site", style: .Default){(action) in
            self.abrirSite()
        }
        
        let abrirMapa = UIAlertAction(title: "Abrir mapa", style: .Default){(action) in
            self.mostrarMapa()
        }
        
        
        let temperaTura = UIAlertAction(title: "Exibir temperatura", style: .Default){(actino) in
            self.mostrarTemperatura()
        }
        
        
        opcoes.addAction(cancelar)
        opcoes.addAction(ligar)
        opcoes.addAction(abrirSite)
        opcoes.addAction(abrirMapa)
        opcoes.addAction(temperaTura)
        
        
        controller.presentViewController(opcoes, animated: true, completion: nil)
        
        
    }
    
    
    private func abrirAplicativoComURL(url:String){
        UIApplication.sharedApplication()
            .openURL( NSURL(string:url)! )
    }
    
    
    private func ligar(){
        let device: UIDevice = UIDevice.currentDevice()
        
        if device.model == "iPhone" {
            abrirAplicativoComURL("tel:" + contato.telefone)
        }else{
            
            let alert = UIAlertController(title: "Impossível fazer ligações", message: "Seu dispositivo não é um iPhone", preferredStyle: .Alert)
           
            
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alert.addAction(okAction)
            
            controller?.presentViewController(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    private func abrirSite(){
        
        var url = contato.site
        
        if !url.hasPrefix("http://") {
            url = "http://" + url
        }
        
        
        abrirAplicativoComURL(url)
        
    }
    
    
    private func mostrarMapa(){
        let url = ("http://maps.google.com/maps?q=" + contato.endereco).stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        
        
        abrirAplicativoComURL( url! )
    }
    
    
    private func mostrarTemperatura(){
        
        let viewController = controller?.storyboard?.instantiateViewControllerWithIdentifier("temperaturaViewControllerID")
        
        let temperaturaController = viewController as! TemperaturaViewController
        
        temperaturaController.contato = self.contato
        
        controller?.navigationController?.pushViewController(temperaturaController, animated: true)
        
        
    }
    
}