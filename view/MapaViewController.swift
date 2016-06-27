//
//  MapaViewController.swift
//  ContatosApp
//
//  Created by Fernando on 27/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        let botaoLocalizacao  = MKUserTrackingBarButtonItem(mapView: self.mapView)
        
        self.navigationItem.rightBarButtonItem = botaoLocalizacao
        
        
        locationManager.requestWhenInUseAuthorization()
        
        
        
    }
    
}
