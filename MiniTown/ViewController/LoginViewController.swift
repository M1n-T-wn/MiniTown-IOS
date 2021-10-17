//
//  ViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/15.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButton(_ sender: Any) {
    }
    
    @IBAction func loginButton(_ sender: Any) {
        guard let id = idTextField.text else { return }
        guard let password = passWordTextField.text  else { return }
        if id == "" {
            loginAlert(title: "아이디를 입력하지 않았습니다.")
        }
        if password == "" {
            loginAlert(title: "비밀번호를 입력하지 않았습니다.")
        } else {
            print("accessToken : \(String(describing: Token.accessToken))\n refreshToken : \(String(describing: Token.refreshToken))")
            logindata(id: id, password: password)

        }
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }
    func loginAlert(title : String) {
        let alert = UIAlertController(title: "\(title)", message: "다시 입력해 주세요.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction =  UIAlertAction(title: "ok", style: UIAlertAction.Style.default)
        alert.addAction(defaultAction)
        self.present(alert, animated: false)
    }

}

