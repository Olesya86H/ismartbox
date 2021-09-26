//
//  LoginViewController.swift
//  ismartbox
//
//  Created by Олеся Зайляпова on 25.09.2021.
//

import UIKit
import OAuth2

class LoginViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var buttonCaontainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onloginButton(){
        
        let oauth2 = OAuth2CodeGrant(settings: [
            "client_id": "MRIfZRi0w4MM9CJSt6Zpb0FOgY5yp9ddVXBLJ3e2c",
            "client_secret": "RiQWtqvG2i2Cac5WmyQE1gba5zuXjID4fwPYJUiuhk165pP3rugiY3LLS737nFlokdFteymgqtTM8wMcJWIR9FcLpMj8aQYh2Ta1VzwR4O7HN0NiPdL8Cp4HFLZTubXC",
            "authorize_uri": "https://ismartbox.ru/api-docs/swagger/",
            "token_uri": "https://ismartbox.ru/o/token/",   // code grant only
            "redirect_uris": ["ismartbox://o/callback"],   // register your own "myapp" scheme in Info.plist
            "scope": "user repo:status",
            "secret_in_body": true,    // Github needs this
            "keychain": false,         // if you DON'T want keychain integration
        ] as OAuth2JSON)
        
       /*
         let base = URL(string: "https://api.github.com")!
         let url = base.appendingPathComponent("user")

         var req = oauth2.request(forURL: url)
         req.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")

         self.loader = OAuth2DataLoader(oauth2: oauth2)
         loader.perform(request: req) { response in
             do {
                 let dict = try response.responseJSON()
                 DispatchQueue.main.async {
                     // you have received `dict` JSON data!
                 }
             }
             catch let error {
                 DispatchQueue.main.async {
                     // an error occurred
                 }
             }
         }
         */
      /*
        GTMOAuth2ViewControllerTouch alloc] */
    }
}
