//
//  IntExtension.swift
//  BankApp
//
//  Created by Kirill Korolev on 18.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import Foundation

public extension Int{
    var stringFormat: String{
        return format()
    }
    
    func format() -> String{
        var array = [String]()
        var string = ""
        splitNumber(&array)
        reverseFill(string: &string, array: array)
        return string
    }
    
    func splitNumber(_ array: inout [String]){
        
        var number = self
        
        while number > 0 {
            let mod = number % 1000
            var modString = ""
            
            if mod == 0{
                modString = "000"
            }
            else{
                modString = "\(mod)"
            }
            
            array.append(modString)
            number = number / 1000
        }
    }
    
    func reverseFill(string: inout String, array:[String]){
        
        for i in 0..<array.count{
            var predicate = ""
            let j = array.count-i-1
            
            if j != array.count-1{
                predicate = ","
            }
            string += predicate+array[j]
        }
        
    }
    
}
