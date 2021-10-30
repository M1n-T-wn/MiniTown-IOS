//
//  OAuthSignUoViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/22.
//

import UIKit
//  not used

class OAuthSignUoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var AConfirmationPress: UIButton!
    @IBOutlet weak var AAuthenticationNumberPress: UIButton!
    @IBOutlet weak var signUpDonePress: UIButton!
    
    @IBOutlet weak var APhoneField: UITextField!
    @IBOutlet weak var ACertifiedField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APhoneField.delegate = self
        ACertifiedField.delegate = self
        let backBarButtonItem = UIBarButtonItem(title: "휴대전화 설정", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)
        self.navigationItem.backBarButtonItem = backBarButtonItem

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    @IBAction func AConfirmationButton(_ sender: Any) {
        self.view.endEditing(true)
        guard let aphoneField = APhoneField.text else { return }
        if aphoneField == "" {
            alert(title: "휴대전화 번호를 입력하세요")
        } else {
            ConfirmationData(phone: aphoneField)
            let alert = UIAlertController(title: "\(aphoneField)로 인증번호를 전송했습니다.", message: "", preferredStyle: UIAlertController.Style.alert)
            let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            alert.addAction(defaultAction)
            self.present(alert, animated: false)
        }
    }
    @IBAction func AAuthenticationNumberButton(_ sender: Any) {
        guard let acertifiedField = ACertifiedField.text else { return }
        if acertifiedField == "" {
            alert(title: "인증번호를 입력하세요.")
        } else {
            print("아까 온 인증번호 : \(String(describing: info.checkPhone)), 지금 입력한 인증번호 : \(acertifiedField)")
            if acertifiedField == info.checkPhone {
                let alert = UIAlertController(title: "인증번호가 일치합니다.", message: "", preferredStyle: UIAlertController.Style.alert)
                let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                alert.addAction(defaultAction)
                self.present(alert, animated: false)
                checkCertifiedDone = true
            } else {
                alert(title: "인증번호가 일치하지 않습니다.")
            }
        }
    }
    
    @IBAction func signUpDoneButton(_ sender: Any) {
        guard let aphoneField = APhoneField.text else { return }
        guard let acertifiedField = ACertifiedField.text else { return }
        
        if aphoneField == "" {
            alert(title: "아이디가 입력되지 않았습니다.")
        }
        if acertifiedField == "" {
            alert(title: "휴대전화가 입력되지 않았습니다.")
        } else {
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondSignUpViewController")
            self.navigationController?.pushViewController(pushVC!, animated: true)
            
            
        }
        
        
    }
    
    @objc
    func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -150
    }
    @objc
    func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    func alert(title : String) {
        let alert = UIAlertController(title: "\(title)", message: "다시 입력해 주세요.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(defaultAction)
        self.present(alert, animated: false)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.APhoneField {
            self.AConfirmationButton(self.AConfirmationPress!)
        }
        if textField == self.ACertifiedField {
            self.AConfirmationButton(self.AConfirmationPress!)
        }
        
        return true
    }
}
