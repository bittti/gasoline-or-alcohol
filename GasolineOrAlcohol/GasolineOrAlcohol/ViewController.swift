//
//  ViewController.swift
//  GasolineOrAlcohol
//
//  Created by Gabriel Bitti on 03/04/19.
//  Copyright © 2019 Bitti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var gasolineTxt: UITextField!
    @IBOutlet weak var alcoholTxt: UITextField!
    
    @IBAction func caltulate(_ sender: Any) {
        if let alcoholValue = alcoholTxt.text {
            if let gasolineValue = gasolineTxt.text {
                let result = self.validate(alcoholValue: alcoholValue, gasolineValue: gasolineValue)
                
                if result {
                    self.calculateBestPrice(alcoholValue: alcoholValue, gasolineValue: gasolineValue)
                } else {
                    resultLabel.text = "Digite os preços para calcular!"
                }
            }
        }
    }
    
    func calculateBestPrice(alcoholValue: String, gasolineValue: String) {
        if let alcoholValue = Double(alcoholValue) {
            if let gasolineValue = Double(gasolineValue) {
                let bestValue = alcoholValue / gasolineValue
                
                if bestValue >= 0.7 {
                    self.resultLabel.text = "Melhor usar Gasolina!"
                } else {
                    self.resultLabel.text = "Melhor usar Álcool!"
                }
            }
        }
    }
    
    func validate(alcoholValue: String, gasolineValue: String) -> Bool {
        var validatedFields = true;
        
        if alcoholValue.isEmpty {
            validatedFields = false;
        } else if gasolineValue.isEmpty {
            validatedFields = false;
        }
        
        return validatedFields
    }
}
