//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calculatorBrain =  CalculatorBrain()
    
    var bmiValue : String?

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightControllerChanged(_ sender: UISlider) {
        let current_value = sender.value
        let rounded = String(format: "%.2f", current_value)
        heightLabel.text = "\(rounded)m"
    }
    
    @IBAction func weightControllerChanged(_ sender: UISlider) {
        let current_value = round(sender.value)
        let rounded = String(format: "%.0f", current_value)
        
        weightLabel.text = "\(rounded)kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let weight = weightSlider.value
        let height = heightSlider.value
        
        calculatorBrain.calculateBMI(height : height, weight : weight)
        
      
        
        
        self.performSegue(withIdentifier:  "goToResult", sender: self)
        
        
        
        
        //       let secondVC = SecondViewController()
        //
        //        secondVC.bmivalue = String(format: "%0.1f", bmi)
        //
        //        self.present(secondVC, animated: true, completion: nil)
        //
        
        
        //goToResult
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            
            let destinationVC = segue.destination as! ResultsViewController
            
            print(destinationVC)
            
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
            
            
            
        }
    }
    
}

