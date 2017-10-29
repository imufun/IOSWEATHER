//
//  ViewController.swift
//  WeatherApi
//
//  Created by imran on 10/29/17.
//  Copyright © 2017 homessolutionbd. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    
    @IBOutlet weak var CityLabel: UILabel!
    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var weatheTypeLabel: UILabel!
    @IBOutlet weak var TempLabel: UILabel!
    
    
    var city : String = ""
    var station : String = ""
    var weatherType : String = ""
    var temprature: Double = 0.0
    
    //  var weather = Weatherity()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getWeatherData()
        // weather.getWeatherData()
        // weather.city = CityLabel.text!
        
        
    }
    
    
    func getWeatherData(){
        let url  = URL(string: API)!
        Alamofire.request(url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, Any>{
                
                // City
                if let name = dict["name"] as? String {
                    self.city = name
                    self.CityLabel.text = self.city
                    print(self.city)
                }
                // station
                if let station = dict["base"] as? String {
                    
                    self.station = station
                    self.stationLabel.text = self.station
                    print(self.station)
                }
                
                // Nested Data Parsing
                if let weather = dict["weather"] as? [Dictionary<String, Any>]{
                    if let main = weather[0]["main"] as? String {
                        self.weatherType = main
                        self.weatheTypeLabel.text = self.weatherType
                    }
                }
                
                
                if let main = dict["main"] as? Dictionary<String, AnyObject>{
                    if let temp = main["temp"] as? Double{
                        self.temprature = temp
                        self.TempLabel.text = "\(self.temprature)"
                        
                    }
                }
                
            }
            print(response)
            
        }
    }
    func UpdateWeaher(){
        // CityLabel.text = weather.city
    }
}

