//
//  TemperaturaViewController.swift
//  ContatosApp
//
//  Created by Fernando on 29/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import UIKit

class TemperaturaViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelMin: UILabel!
    @IBOutlet weak var labelMax: UILabel!
    @IBOutlet weak var labelTempAtual: UILabel!
    @IBOutlet weak var indicatorTempAtual: UIActivityIndicatorView!
    
    let URL_BASE = "http://api.openweathermap.org/data/2.5/weather?APPID=b17e3ecb3a522693a296a018d8a86d33&units=metric"
    let URL_BASE_IMAGE = "http://openweathermap.org/img/w/"
    
    var contato: Contato?
    var main: NSDictionary?
    var weather: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.indicatorTempAtual.startAnimating()
        
        
        let url: NSURL = NSURL(string: URL_BASE + "&lat=\(contato!.latitude)&lon=\(contato!.longitude)")!
        
        let requestURL = NSMutableURLRequest(URL: url)
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let task = session.dataTaskWithRequest(requestURL) { (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if statusCode == 200 {
                do{
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
                    
                    self.main = json["main"] as? NSDictionary
                    self.weather = json["weather"]![0] as? NSDictionary
                    
                    let min = (self.main!["temp_min"] as? NSNumber)!
                    let max = (self.main!["temp_max"] as? NSNumber)!
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        self.labelMin.text = min.stringValue + " º"
                        self.labelMin.hidden = false
                    
                        self.labelMax.text = max.stringValue + " º"
                        self.labelMax.hidden = false
                    
                        self.labelTempAtual.text = (self.weather!["main"] as? String)!
                        self.labelTempAtual.hidden = false
                    
                        self.recuperarImagem()
                    
                        self.indicatorTempAtual.stopAnimating()
                    }
                    
                }catch let error as NSError{
                    print("Não foi possível fazer o parse do JSON: \(error.localizedDescription)")
                }
            }
            
            
        }
        
        task.resume()
        
    }
    
    func recuperarImagem(){
        let iconName = self.weather!["icon"] as! String
        let url = NSURL(string: URL_BASE_IMAGE + iconName + ".png")!
        
        
        let requestURL = NSMutableURLRequest(URL: url)
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let task = session.dataTaskWithRequest(requestURL){
            (data, response, error) -> Void in
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if statusCode == 200 {
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.imageView.image = UIImage(data: data!)
                }
                
            }
            
            
        }
        
        task.resume()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
