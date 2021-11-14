//
//  LoginViewController.swift
//  ismartbox
//
//  Created by Олеся Зайляпова on 25.09.2021.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var buttonCaontainerView: UIView!
    
    @IBOutlet weak var pass_textfield: UITextField!
    @IBOutlet weak var login_textfield: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func onloginButton(){
        let str1 = String("&username=") + String(login_textfield.text!)
        let str2 = String("&password=") + String(pass_textfield.text!)
        let headers = [
          "user-agent": "vscode-restclient",
          "authorization": "Basic UklmWlJpMHc0TU05Q0pTdDZacGIwRk9nWTV5cDlkZFZYQkxKM2UyYzpSaVFXdHF2RzJpMkNhYzVXbXlRRTFnYmE1enVYaklENGZ3UFlKVWl1aGsxNjVwUDNydWdpWTNMTFM3MzduRmxva2RGdGV5bWdxdFRNOHdNY0pXSVI5RmNMcE1qOGFRWWgyVGExVnp3UjRPN0hOME5pUGRMOENwNEhGTFpUdWJYQw==",
          "content-type": "application/x-www-form-urlencoded"
        ]

        let postData = NSMutableData(data: "grant_type=password".data(using: String.Encoding.utf8)!)
        postData.append(str1.data(using: String.Encoding.utf8)!)
        postData.append(str2.data(using: String.Encoding.utf8)!)

       // postData.append("&username=0000000001".data(using: String.Encoding.utf8)!)
      // postData.append("&password=testuser".data(using: String.Encoding.utf8)!)

        let request = NSMutableURLRequest(url: NSURL(string: "https://ismartbox.ru/o/token/")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data

        let session = URLSession.shared
        
        let dataTask =  session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error)
          } else {
            let httpResponse = response as? HTTPURLResponse
           print(httpResponse)
              if httpResponse?.statusCode == 400
              {
                  DispatchQueue.global().async {
                      DispatchQueue.main.sync {
                        
                  let alert = UIAlertController(title: "Ошибка", message: "Проверьте правильность введённых данных!", preferredStyle: UIAlertController.Style.alert)
                  alert.addAction(UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.default, handler: nil))
                 self.present(alert, animated: true, completion: nil)
                      }
                  }
              }
              else
              {
              DispatchQueue.global().async {
                  DispatchQueue.main.sync {
                      let splashController = self.storyboard?.instantiateViewController(withIdentifier: "splashVC")
                      self.navigationController?.pushViewController(splashController!, animated: true)
                  }
              }
            }
          }
        })

        dataTask.resume()
        
    }
    
}
