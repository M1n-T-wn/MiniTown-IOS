//
//  SignUpViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/16.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var LoginpressButton: UIButton!
    @IBOutlet weak var SidField: UITextField!
    @IBOutlet weak var SnameField: UITextField!
    @IBOutlet weak var SrpwField: UITextField!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)
//        let yourBackImage = UIImage(named: "HomeIcon")
//        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
//        self.navigationController?.navigationBar.backItem?.title = ""

        SidField.delegate = self
        SnameField.delegate = self
        SrpwField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func LoginPageButton(_ sender: UIButton) {
        guard let sidField = SidField.text else { return }
        guard let snameField = SnameField.text else { return }
        guard let srpwField = SrpwField.text else { return }
        
        if sidField == "" {
            alert(title: "아이디가 입력되지 않았습니다.")
        }
        if snameField == "" {
            alert(title: "이름이 입력되지 않았습니다.")
        }
        if srpwField == "" {
            alert(title: "비밀번호를 입력하세요.")
        }
        else {
            signupdata(id: sidField, name: snameField, password: srpwField)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    func alert(title : String) {
        let alert = UIAlertController(title: "\(title)", message: "다시 입력해 주세요.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(defaultAction)
        self.present(alert, animated: false)
    }
    override func viewDidLayoutSubviews() {
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.SidField {
            SnameField.becomeFirstResponder()
        }
        if textField == self.SnameField{
            SrpwField.resignFirstResponder()
        }
        if textField == self.SrpwField{
            self.LoginPageButton(self.LoginpressButton)
        }
        return true
    }
}
