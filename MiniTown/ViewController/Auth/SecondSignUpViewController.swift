//
//  SecondSignUpViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/21.
//

import UIKit

class SecondSignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var genderControl: UISegmentedControl!
    @IBOutlet weak var UIbirthDatePicker: UIDatePicker!
    @IBOutlet weak var returnLoginPress: UIButton!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var returnPasswordField: UITextField!
    
    let dateFormatter : DateFormatter = {
        let formatter : DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genderControl.selectedSegmentIndex = 0
        nameField.delegate = self
        passwordField.delegate = self
        returnPasswordField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func birthDatePicker(_ sender: Any) {
        let date : Date = self.UIbirthDatePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        info.birth = dateString
    }
    @IBAction func genderChanged(_ sender: Any) {
        switch genderControl.selectedSegmentIndex
        {
        case 0:
            info.gender = "MEN"
        case 1:
            info.gender = "MEN"
        case 2:
            info.gender = "WOMEN"
        default:
            signUpAlert(title: "성별을 선택하지 않았습니다.")
            break
        }
    }
    @IBAction func returnLoginButton(_ sender: Any) {
        
        guard let snameField = nameField.text else { return }
        guard let spassField = passwordField.text else { return }
        guard let sreturnpwField = returnPasswordField.text else { return }
        print(snameField)
        if info.gender == nil{
            signUpAlert(title: "성별을 선택하지 않았습니다.")
        }
        if snameField == "" {
            signUpAlert(title: "이름을 입력하지 않았습니다.")
        }
        if spassField == "" {
            signUpAlert(title: "비밀번호를 입력하지 않았습니다.")
        }
        if sreturnpwField != spassField  {
            signUpAlert(title: "비밀번호가 일치하지 않습니다.")
        } else {
            info.name = snameField
            info.loginType = "LOCAL"
            info.password = sreturnpwField
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "3rdSignUpViewController")
            self.navigationController?.pushViewController(pushVC!, animated: true)
        }
    }
    @objc
    func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -150
    }
    @objc
    func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.nameField {
            passwordField.becomeFirstResponder()
        }
        if textField == self.passwordField {
            returnPasswordField.becomeFirstResponder()
        }
        if textField == self.returnPasswordField{
            self.returnLoginButton(self.returnLoginPress!)
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    func signUpAlert(title : String) {
        let alert = UIAlertController(title: "\(title)", message: "다시 입력해 주세요.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(defaultAction)
        self.present(alert, animated: false)
    }
}
