//
//  Results.swift
//  EZsplit
//
//  Created by Hayato Nakamura on 2019/09/18.
//  Copyright © 2019 Hayatopia. All rights reserved.
//

import UIKit

class Results: UIViewController {
    
    @IBOutlet weak var cur_name: UILabel!
    @IBOutlet weak var value: UILabel!
    
    var counter = 0
    var moneyarray:[Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        var m = defaults.stringArray(forKey: "members") ?? [String]()
        cur_name.text = m[counter]
        
        // food names
        let foodnames = defaults.stringArray(forKey: "Food Names") ?? [String]()
        // How much you owe
        var money = 0.00
        
        // tip and tax
        var tip = 0.0
        
        var total_money = 0.0
        // Calculating the total money
        for food in foodnames {
            let temp = String(food) + "$"
            let food_price = defaults.double(forKey: temp)
            total_money = total_money + food_price
        }
        
        for peeps in m {
            for food in foodnames {
                // Who ordered this food
                let membersInvolved = defaults.stringArray(forKey: food) ?? [String]()
                for names in membersInvolved {
                    if (peeps == names) {
                        let temp = food + "$"
                        let food_price = defaults.double(forKey: temp)
                        money = Double(Double(money) + (food_price/Double(membersInvolved.count)))
                        break
                    }
                }
            }
            let tip_percentage = defaults.double(forKey: "tip")
            var tax = defaults.double(forKey: "tax")
            tip = (money/total_money) * (tip_percentage/100)*total_money
            tax = (money/total_money) * (tax)
            print(peeps)
            print(money)
            print(tip)
            print(tax)
            print("")
            money = money + tip + tax
            defaults.set(money, forKey: peeps)
            money = 0.0
        }
        
        
        
        cur_name.text = m[0]
        value.text = String(defaults.double(forKey: m[0]))
        
        for f in foodnames {
            print(f)
            let membersInvolved = defaults.stringArray(forKey: f) ?? [String]()
            print(membersInvolved)
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
    @IBAction func next(_ sender: Any) {
        counter = counter + 1

        let defaults = UserDefaults.standard
        var m = defaults.stringArray(forKey: "members") ?? [String]()
        
        cur_name.text = m[counter % m.count]
        value.text = String(defaults.double(forKey: m[counter % m.count]))
        
        
    }
    
}
