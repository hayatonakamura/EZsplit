//
//  Selection.swift
//  EZsplit
//
//  Created by Hayato Nakamura on 2019/09/18.
//  Copyright © 2019 Hayatopia. All rights reserved.
//

import UIKit

class Selection: UIViewController {

    @IBOutlet weak var current_food: UILabel!
    var counter = 0
    var names:[String] = []
    @IBOutlet weak var name_text: UITextField!
    @IBOutlet weak var added: UILabel!
    var people:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        let food_names = defaults.stringArray(forKey: "Food Names") ?? [String]()
        defaults.set(people, forKey: "members")
        
        current_food.text = food_names[counter]
        
        let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { timer in
            if (self.added.isHidden == false) {
                self.added.isHidden = true
            }
        })
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
    
    @IBAction func add_name(_ sender: Any) {
        if (name_text.text != nil) {
            names.append(name_text.text!)
            added.isHidden = false
            
            // Add the members names too
            let defaults = UserDefaults.standard
            var m = defaults.stringArray(forKey: "members") ?? [String]()
            let cur = String(name_text.text!)
            m.append(cur)
            let s = Array(Set(m))
            
            defaults.set(s, forKey: "members")
            
            name_text.text = ""
        }
    }
    
    @IBAction func next_food(_ sender: Any) {
        let defaults = UserDefaults.standard
        let food_names = defaults.stringArray(forKey: "Food Names") ?? [String]()
        defaults.set(names, forKey: food_names[counter])
        names = []
        counter = counter + 1
        if (counter < food_names.count) {
            current_food.text = food_names[counter]
        }


    }

    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}



