//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Viridiana Jimenez on 2/22/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit
struct CalculatorBrain {
    
    
    var bmi: BMI?
   
   
    func getBMIValue() -> String {
        
        let bmiOneDecimalPlace = String(format: "%.0f", bmi?.value ?? 0.0)
        return bmiOneDecimalPlace
        
    }
    
    

    mutating func calculateBMI(height: Float, weight: Float) {
     let bmiValue = weight / (height * height)
        if bmiValue <= 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat les snacks", color: UIColor.systemRed)
        }
        else if bmiValue <= 24.9 {
            bmi =  BMI(value: bmiValue, advice: "Amazing, Keep going", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)) //colorLiteral
        }
        else{
            bmi =  BMI(value: bmiValue, advice: "Eat less snacks", color: UIColor.systemBlue)
        }
    
     
  
}
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.systemPink
    }
    
  
}
