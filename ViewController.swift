//
//  ViewController.swift
//  EZsplit
//
//  Created by Hayato Nakamura on 2019/09/18.
//  Copyright © 2019 Hayatopia. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    let durationOfAnimationInSecond = 1.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
    
    
    
    func transitionAnimation(view: UIView, animationOptions: UIView.AnimationOptions, isReset: Bool) {
        UIView.transition(with: view, duration: durationOfAnimationInSecond, options: animationOptions, animations: {
            view.backgroundColor = UIColor.init(named: isReset ? "darkGreen" :  "darkRed")
        }, completion: nil)
    }


}

