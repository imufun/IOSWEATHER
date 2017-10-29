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
    
    var city : String
    
    
    init(city: String) {
        self.city = city
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
