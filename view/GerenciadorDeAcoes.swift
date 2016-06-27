//
//  GerenciadorDeAcoes.swift
//  ContatosApp
//
//  Created by Fernando on 24/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import Foundation
import UIKit

class GerenciadorDeAcoes: NSObject, UIActionSheetDelegate {
    
    let contato:Contato
    var controller: UIViewController?
    
    init(withContato contato:Contato) {
        self.contato = contato
    }
    
    
    func acoesDoController(controller: UIViewController){
        self.controller = controller
        
        let opcoes: UIActionSheet = UIActionSheet(title: contato.nome, delegate: self, cancelButtonTitle: "Cancelar", destructiveButtonTitle: nil, otherButtonTitles: "Ligar", "Visualizar site", "Abrir mapa")
        
        
        opcoes.showInView(self.controller!.view)
        
        
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
            UIAlertView(title: "Impossível fazer ligações", message: "Seu dispositivo não é um iPhone", delegate: nil, cancelButtonTitle: "Ok").show()
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
    
    
    //MARK: delegate - UIActionSheetDelegate
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        
        switch buttonIndex {
        case 1:
            ligar()
            break
        case 2:
            abrirSite()
            break
        case 3:
            mostrarMapa()
            break
        default:
            break
        }
        
    }
    
}