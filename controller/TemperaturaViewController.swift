//
//  TemperaturaViewController.swift
//  ContatosApp
//
//  Created by Fernando on 29/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import Alamofire
import AlamofireImage
import UIKit

class TemperaturaViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelMin: UILabel!
    @IBOutlet weak var labelMax: UILabel!
    @IBOutlet weak var labelTempAtual: UILabel!
    
    let URL_BASE = "http://api.openweathermap.org/data/2.5/weather?APPID=b17e3ecb3a522693a296a018d8a86d33"
    let URL_BASE_IMAGE = "http://openweathermap.org/img/w/"
    
    var contato: Contato?
    var main: NSDictionary?
    var weather: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let params = ["lat": contato!.latitude, "lon":contato!.longitude, "units": "metric"]
            
        
        Alamofire
            .request(.GET, URL_BASE, parameters: params)
            .responseJSON(completionHandler: { response in
                
                if let res = response.result.value as? NSDictionary {
                    
                    self.main = res["main"] as? NSDictionary
                    self.weather = res["weather"]![0] as? NSDictionary
                    
                    let min = (self.main!["temp_min"] as? NSNumber)!
                    let max = (self.main!["temp_max"] as? NSNumber)!
                    
                    self.labelMin.text = min.stringValue
                    self.labelMin.hidden = false
                    
                    self.labelMax.text = max.stringValue
                    self.labelMax.hidden = false
                    
                    self.labelTempAtual.text = (self.weather!["main"] as? String)!
                    self.labelTempAtual.hidden = false
                    
                    self.recuperarImagem()
                    
                }else{
                    print(response.result.error)
                }
            })
        
        
    }
    
    
    func recuperarImagem(){
        let iconName = weather!["icon"] as! String
        let url = NSURL(string: URL_BASE_IMAGE + iconName + ".png")
        self.imageView.af_setImageWithURL(url!)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
