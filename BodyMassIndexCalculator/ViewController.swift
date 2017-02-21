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
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var resultCategoryLabel: UILabel!
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var currentUnits: UILabel!

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
        var heightDouble:Double? =  nil
        var weightDouble:Double? = nil
        var bmiDouble = 0.0
        
        if(heightTextField.text! != "" && weightTextField.text! != "")
        {
            heightDouble = Double(heightTextField.text!)!
            weightDouble = Double(weightTextField.text!)!
            
            
            //convert English to Metric
            //1lbs is 0.453592 kg
            //1ft is 0.3048 m
            if !metricBool
            {
                heightDouble = heightDouble!*0.3048
                weightDouble = weightDouble!*0.453592
            }
            bmiDouble = weightDouble!/(pow(heightDouble!,2))
            //round bmi to lower the decimal precision
            bmiDouble = round((bmiDouble*10))/10
            
            
            if bmiDouble < 16.00 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Severe Thinness"
                self.displayImageView.image = UIImage(named: "steak")
            } else if bmiDouble < 17.00 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Moderate Thinness"
                displayImageView.image = UIImage(named: "steak")
            } else if bmiDouble < 18.50 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Mild Thinness"
                displayImageView.image = UIImage(named: "mildthinness")
            } else if bmiDouble < 25 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Normal Range"
            } else if bmiDouble < 30 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Overweight"
            } else if bmiDouble < 35 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Obese Class I (Moderate)"
                self.displayImageView.image = UIImage(named:"OClass" )

            } else if bmiDouble  < 40 {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Obese Class II (Severe)"
                self.displayImageView.image = UIImage(named:"OClass" )

            } else {
                resultCategoryLabel.text = "\(Float(bmiDouble)) Obese Class III (Very Severe)"
                self.displayImageView.image = UIImage(named:"OClass" )

            }
           
        }
    }
    
}

