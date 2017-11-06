//
//  Weather.swift
//  WeatherApi
//
//  Created by imran on 10/29/17.
//  Copyright © 2017 homessolutionbd. All rights reserved.
//

import UIKit
import Alamofire

class Weather{
    
    var city : String!
    var _date : String!
    var weatherType : String!
    var currentWeatherTemp : Double!
    
    var cityName: String {
        if city == nil {
            city = ""
        }
        return city
    }
    
    var WeatherDate : String {
        
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter  = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var WeatherConType : String {
        if weatherType == nil {
            weatherType = ""
        }
        
        return weatherType
    }
    
    var currentTeprature : Double {
        if currentWeatherTemp == nil {
            currentWeatherTemp = 0.0
        }
        
        return currentWeatherTemp
    }
    
    
//    
//    func getWeatherData(){
//        let url  = URL(string: API)!
//        Alamofire.request(url).responseJSON { response in
//            let result = response.result
//           
//            if let dict = result.value as? Dictionary<String, Any>{
//                if let name = dict["name"] as? String {
//                    self.city = name
//                    print(self.city)
//                }
//                
//            }
//            print(response)
//            
//        }
//    }
}
