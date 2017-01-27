//
//  ViewController.swift
//  WorldTrotter
//
//  Created by JUAN RAMIREZ on 1/21/17.
//  Copyright © 2017 EZ IT Apps, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var celciusLabel: UILabel!
    
    @IBOutlet weak var userInputValue: UITextField!
    
    var fahrenheitValue: Measurement < UnitTemperature >?{
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Measurement < UnitTemperature >? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted( to: .celsius)
        } else {
            return nil
        }
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celciusLabel.text = numberFormatter.string( from: NSNumber( value: celsiusValue.value))
            
        } else {
            celciusLabel.text = "???"
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeparator = textField.text?.range( of: ".")
        let replacementTextHasDecimalSeparator = string.range( of: ".")
        
        let charactersNotAllowed = NSCharacterSet.letters
        let replacementTextHasLetter = string.rangeOfCharacter(from: charactersNotAllowed)
        
        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil{
            if replacementTextHasLetter != nil{
                return false
            }
            return false
        } else {
            if replacementTextHasLetter != nil{
                return false
            }
            return true
        }
        
    }
    

    
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        userInputValue.resignFirstResponder()
    }
    
    
    
    @IBAction func tempUserInput(_ sender: Any) {
        //celciusLabel.text = userInputValue.text
        
        /*
        if let valueInput = userInputValue.text, !valueInput.isEmpty {
            
            celciusLabel.text = valueInput
            
        } else {
            
            celciusLabel.text = "???"
            
        }
         */
        if let valueInput = userInputValue.text, let value = Double(valueInput){
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateCelsiusLabel()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

