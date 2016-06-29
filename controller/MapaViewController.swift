//
//  MapaViewController.swift
//  ContatosApp
//
//  Created by Fernando on 27/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let identificadorPino = "pino"
    let locationManager = CLLocationManager()
    let dao = ContatoDAO.sharedInstance()
    var contatos: [Contato]?
    
    override func viewDidLoad() {
        
        mapView.delegate = self
        
        let botaoLocalizacao  = MKUserTrackingBarButtonItem(mapView: self.mapView)
        
        self.navigationItem.rightBarButtonItem = botaoLocalizacao
        
        locationManager.requestWhenInUseAuthorization()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        contatos = dao.list()
        mapView.addAnnotations(contatos!)
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        mapView.removeAnnotations(contatos!)
    }
    
    
    //MARK: delegates
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation.isKindOfClass(MKUserLocation){
            return nil
        }
        
        var pino:MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(self.identificadorPino) as? MKPinAnnotationView
        
        if pino == nil {
            pino = MKPinAnnotationView(annotation: annotation, reuseIdentifier: self.identificadorPino)
        }
        
        pino!.annotation = annotation
        pino!.pinTintColor = UIColor.redColor()
        pino!.canShowCallout = true
        
        let contato = annotation as! Contato
        
        if contato.foto != nil {
            let imageContato = UIImageView(frame: CGRect(x: 0, y: 0, width: 32.0, height: 32.0))
        
            imageContato.image = contato.foto
            pino!.leftCalloutAccessoryView = imageContato
        }
        
        
        return pino
        
    }
    
}
