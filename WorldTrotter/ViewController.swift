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
    
    @IBAction func tempUserInput(_ sender: Any) {
        celciusLabel.text = userInputValue.text
        
        
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

