//
//  NumOfPeople.swift
//  EZsplit
//
//  Created by Hayato Nakamura on 2019/09/18.
//  Copyright © 2019 Hayatopia. All rights reserved.
//

import UIKit

class NumOfPeople: UIViewController {

    @IBOutlet weak var food_name: UITextField!
    @IBOutlet weak var food_price: UITextField!
    
    var food: [String] = []
    var price: [Double] = []
    @IBOutlet weak var added: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
        added.isHidden = true
        let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { timer in
            if (self.added.isHidden == false) {
                self.added.isHidden = true
            }
        })

    }
    

    @IBAction func add_data(_ sender: Any) {
        
        if (food_name.text != nil && food_price.text != nil) {
            food.append(String(food_name.text!))
            price.append(Double(food_price.text!) as! Double)
            
            let defaults = UserDefaults.standard
            let temp = String(food_name.text!) + "$"
            defaults.set(Double(food_price.text!), forKey: temp)
            
            food_name.text = ""
            food_price.text = ""
            
            added.isHidden = false
            
            
            defaults.set(food, forKey: "Food Names")
            defaults.set(price, forKey: "Food Prices")
        }
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        food_name.resignFirstResponder()
//        return true
//    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
