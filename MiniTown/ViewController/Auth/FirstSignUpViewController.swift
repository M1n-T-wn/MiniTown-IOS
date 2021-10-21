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
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)
        self.navigationController?.navigationBar.backItem?.title = "아이디 설정"
        
        SidField.delegate = self
        SPhoneField.delegate = self
        SCertifiedField.delegate = self
        
    }
    @IBAction func DuplicateConfirmationButton(_ sender: Any) {
        guard let sidField = SidField.text else { return }
        DuplicateIdData(id: sidField)
        if sidField == "" {
            alert(title: "아이디를 입력해 주세요")
        } else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
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
        
        guard let spwField = SCertifiedField.text else { return }
        
        if spwField == "" {
            alert(title: "인증번호를 입력하세요.")
        } else {
            print("아까 온 인증번호 : \(String(describing: checkPhoneD)), 지금 입력한 인증번호 : \(spwField)")
            if spwField == checkPhoneD {
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
        else {
            info.id = sidField
            info.phone = sphoneField
            print(info.id as Any, info.phone  as Any, info.birth  as Any, info.gender  as Any, info.password  as Any)
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
    //    override func viewDidLayoutSubviews() {
    //    }
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        if textField == self.SidField {
    //            SnameField.becomeFirstResponder()
    //        }
    //        if textField == self.SnameField{
    //            SrpwField.resignFirstResponder()
    //        }
    //        if textField == self.SrpwField{
    //            self.LoginPageButton(self.LoginpressButton)
    //        }
    //        return true
    //    }
}
