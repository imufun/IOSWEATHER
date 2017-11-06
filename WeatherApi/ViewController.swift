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
    
    
    let url  = URL(string: API)!
    @IBOutlet weak var CityLabel: UILabel!
    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var weatheTypeLabel: UILabel!
    
    @IBOutlet weak var weatherdes: UILabel!
    @IBOutlet weak var TempLabel: UILabel!
    
    @IBOutlet weak var WeatherImage: UIImageView!
    
    
    var city : String = ""
    var station : String = ""
    var weatherType : String = ""
    var temprature: Double = 0.0
    var descriptionText: String = ""
    //  var weather = Weatherity()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getWeatherData()
        // weather.getWeatherData()
        // weather.city = CityLabel.text!
        
        
    }
    
    
    func getWeatherData(){
 
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
                  //  self.stationLabel.text = self.station
                    print(self.station)
                }
                
                // Nested Data Parsing
                if let weather = dict["weather"] as? [Dictionary<String, Any>]{
                    if let main = weather[0]["main"] as? String {
                        self.weatherType = main
                        self.weatheTypeLabel.text = self.weatherType
                    }
                    if let des = weather[0]["description"] as? String {
                        self.descriptionText = des
                        self.weatherdes.text = self.descriptionText
                    }
                    if let img = weather[0]["icon"] as? UIImageView {
                        self.WeatherImage = img
                        
                    }
//                    if let description = dict["description"] as? [Dictionary<String, Any>]{
//                        if let
//                    }
                }
                
                
                if let main = dict["main"] as? Dictionary<String, AnyObject>{
                    if let temp = main["temp"] as? Double{
                        self.temprature = temp - 273.15
                        self.TempLabel.text = String(format: "%.0f", self.temprature)
                     }
                }
                
            }
            print(response)
            
        }
    }
    func UpdateWeaher(){
        
       // let url  = URL(string: API)!
        //CityLabel.text = weather.city
//       Alamofire.request(url, method: .post, parameters: Parameters, encoding: JSONEncoding.default, headers: nil){
//           response in
//        }
        
    }
}

