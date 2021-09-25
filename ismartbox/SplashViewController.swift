//
//  SplashViewController.swift
//  ismartbox
//
//  Created by Олеся Зайляпова on 25.09.2021.
//

import UIKit

class SplashViewController: UIViewController/*, ISmartBoxLoginDelegate*/ {
   // let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
   /* override func viewDidAppear(animated: Bool){
        super.viewDidAppear(animated)
        
        if(!appDelegate.splashDelay) {
            delay(1.0, closure:{
                self.continueLogin()
            })
        }
    }
    func goToLogin() {
        self.performSegue(withIdentifier: "LoginDegue", sender: self)
    }
    
    func continueLogin() {
        appDelegate.splashDelay = false
        self.goToLogin()
        }
    */
}
