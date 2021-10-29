//
//  SignUpViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/16.
//

import UIKit

class FirstSignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var DuplicateConfirmationPress: UIButton!
    @IBOutlet weak var ConfirmationPress: UIButton!
    @IBOutlet weak var AuthenticationNumberPress: UIButton!
    @IBOutlet weak var LoginpressButton: UIButton!
    
    @IBOutlet weak var SidField: UITextField!
    @IBOutlet weak var SPhoneField: UITextField!
    @IBOutlet weak var SCertifiedField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backBarButtonItem = UIBarButtonItem(title: "아이디 설정", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)
        self.navigationController?.navigationBar.backItem?.title = "아이디 설정"
        
        SidField.delegate = self
        SPhoneField.delegate = self
        SCertifiedField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    @IBAction func DuplicateConfirmationButton(_ sender: Any) {
        self.view.endEditing(true)
        guard let sidField = SidField.text else { return }
        if sidField == "" {
            alert(title: "아이디를 입력해 주세요")
        } else {
            DuplicateIdData(id: sidField)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.8) {
                print(checkId as Any)
                if checkId ==  "Available Id"{
                    let alert = UIAlertController(title: "\(sidField)는 사용 가능한 아이디 입니다.", message: "", preferredStyle: UIAlertController.Style.alert)
                    let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: false)
                    checkIdDone = true
                } else if checkId != "Available Id"{
                    let alert = UIAlertController(title: "\(sidField)는 사용이 불가능한 아이디 입니다.", message: "다른 아이디를 입력해 주세요.", preferredStyle: UIAlertController.Style.alert)
                    let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: false)
                }
            }
        }
    }
    
    @IBAction func ConfirmationButton(_ sender: Any) {
        self.view.endEditing(true)
        guard let sphoneField = SPhoneField.text else { return }
        if sphoneField == "" {
            alert(title: "휴대전화 번호를 입력하세요")
        } else {
            ConfirmationData(phone: sphoneField)
            let alert = UIAlertController(title: "\(sphoneField)로 인증번호를 전송했습니다.", message: "", preferredStyle: UIAlertController.Style.alert)
            let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            alert.addAction(defaultAction)
            self.present(alert, animated: false)
        }
    }
    
    @IBAction func AuthenticationNumberButton(_ sender: Any) {
        self.view.endEditing(true)
        guard let sphoneField = SPhoneField.text else { return }
        guard let spwField = SCertifiedField.text else { return }
        
        if spwField == "" {
            
            alert(title: "인증번호를 입력하세요.")
        } else {
            DuplicatePhoneIdData(phone: sphoneField, check: spwField)
        }
    }
    
    @IBAction func LoginPageButton(_ sender: UIButton) {
        guard let sidField = SidField.text else { return }
        guard let sphoneField = SPhoneField.text else { return }
        guard let spwField = SCertifiedField.text else { return }
        
        if sidField == "" {
            alert(title: "아이디가 입력되지 않았습니다.")
        }
        if sphoneField == "" {
            alert(title: "휴대전화가 입력되지 않았습니다.")
        }
        if spwField == "" {
            alert(title: "인증번호를 입력하세요.")
        }
        if checkIdDone == false{
            alert(title: "아이디 중복확인이 필요합니다.")
        }
        if checkCertifiedDone == false {
            alert(title: "휴대전화 인증이 필요합니다.")
        }
        if checkPhoneDone == false {
            alert(title: "인증번호가 일치하지 않습니다.")
        }
        else {
            info.checkPhone = spwField
            info.id = sidField
            info.phone = sphoneField
            print(info.checkPhone as Any, info.id as Any, info.phone  as Any, info.birth  as Any, info.gender  as Any, info.password  as Any)
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondSignUpViewController")
            self.navigationController?.pushViewController(pushVC!, animated: true)
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
    @objc
    func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -150
        
    }
    @objc
    func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
        override func viewDidLayoutSubviews() {
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == self.SidField {
                self.DuplicateConfirmationButton(self.DuplicateConfirmationPress!)
            }
            if textField == self.SPhoneField{
                self.AuthenticationNumberButton(self.AuthenticationNumberPress!)
            }
            if textField == self.SCertifiedField{
                self.LoginPageButton(self.LoginpressButton)
            }
            return true
        }
}
