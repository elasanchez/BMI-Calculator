//
//  ViewController.swift
//  BodyMassIndexCalculator
//
//  Created by Luigi on 2/19/17.
//  Copyright © 2017 Luigi. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
                }
    //
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    
    //MARK: Properties and Global Var
    
    @IBOutlet weak var inchTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var resultCategoryLabel: UILabel!
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var currentUnits: UILabel!

    @IBOutlet weak var statementLabel: UILabel!
    
    
    
    var metricBool = true

    
    //MARK:Functions
    @IBAction func metricSwitch(_ sender: UISwitch) {
        if sender.isOn{
            metricBool = true
            currentUnits.text = "Metric (kg, m)"
        }
        else{
            metricBool = false
            currentUnits.text = "English (lbs, ft)"
        }
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        let KILO_RATIO = 0.453592
        let METER_RATIO = 0.3048
        
        var heightDouble:Double? =  nil
        var inchInt = 0;
        var weightDouble:Double? = nil
        var bmiDouble = 0.0
        
        if(heightTextField.text! != "" && weightTextField.text! != "")
        {
            heightDouble = Double(heightTextField.text!)!
            weightDouble = Double(weightTextField.text!)!
            if(inchTextField.text != "0")
            {
                inchInt = Int(inchTextField.text!)!
                heightDouble = heightDouble! + Double(inchInt)/12.00
            }
            
    
            if !metricBool
            {
                heightDouble = heightDouble!*METER_RATIO
                weightDouble = weightDouble!*KILO_RATIO
            }
            bmiDouble = weightDouble!/(pow(heightDouble!,2))
            //round bmi to lower the decimal precision
            bmiDouble = round((bmiDouble*10))/10
            
            
            if bmiDouble < 16.00 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Severe Thinness"
                self.displayImageView.image = UIImage(named: "steak")
                statementLabel.text = "You need more gains!"
            } else if bmiDouble < 17.00 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Moderate Thinness"
                displayImageView.image = UIImage(named: "steak2")
                statementLabel.text = "Eat more meat."
            } else if bmiDouble < 18.50 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Mild Thinness"
                displayImageView.image = UIImage(named: "lamb")
                statementLabel.text = "Eat a little more."
            } else if bmiDouble < 25 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Normal Range"
                displayImageView.image = UIImage(named: "healthyFood")
                statementLabel.text = "You are doing just fine, keep it up!"
            } else if bmiDouble < 30 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Overweight"
                displayImageView.image = UIImage(named: "Overweight")
                statementLabel.text = "Start cutting those sweets."
            } else if bmiDouble < 35 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Obese Class I (Moderate)"
                displayImageView.image = UIImage(named:"oclass1" )
                statementLabel.text = "Moderation is the key."
            } else if bmiDouble  < 40 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Obese Class II (Severe)"
                displayImageView.image = UIImage(named:"oclass2" )
                statementLabel.text = "Got to start somewhere."
            } else {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Obese Class III (Very Severe)"
                self.displayImageView.image = UIImage(named:"OClass3" )
                statementLabel.text = "Have a soup instead."

            }
        }
    }
    
}

