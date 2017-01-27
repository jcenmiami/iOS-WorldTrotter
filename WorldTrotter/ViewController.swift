//
//  ViewController.swift
//  WorldTrotter
//
//  Created by JUAN RAMIREZ on 1/21/17.
//  Copyright © 2017 EZ IT Apps, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var celciusLabel: UILabel!
    
    @IBOutlet weak var userInputValue: UITextField!
    
    var fahrenheitValue: Measurement < UnitTemperature >?
    var celsiusValue: Measurement < UnitTemperature >? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted( to: .celsius)
        } else {
            return nil
        }
    }
    
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        userInputValue.resignFirstResponder()
    }
    
    
    
    @IBAction func tempUserInput(_ sender: Any) {
        //celciusLabel.text = userInputValue.text
        
        if let valueInput = userInputValue.text, !valueInput.isEmpty {
            
            celciusLabel.text = valueInput
            
        } else {
            
            celciusLabel.text = "???"
            
        }
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

