//
//  TipandTax.swift
//  EZsplit
//
//  Created by Hayato Nakamura on 2019/09/18.
//  Copyright © 2019 Hayatopia. All rights reserved.
//

import UIKit

class TipandTax: UIViewController {

    @IBOutlet weak var tax: UITextField!
    @IBOutlet weak var tip: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func insert(_ sender: Any) {
        
        if (tax.text != nil && tip.text != nil) {
            let defaults = UserDefaults.standard
            let tipvalue = Double(tip.text!)
            let taxvalue = Double(tax.text!)
            defaults.set(tipvalue, forKey: "tip")
            defaults.set(taxvalue, forKey: "tax")
        }
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
