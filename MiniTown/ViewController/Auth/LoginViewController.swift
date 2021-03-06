//
//  ViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/15.
//

import UIKit

import Toaster
import GoogleSignIn

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    @IBOutlet weak var LoginPress: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
        let backBarButtonItem = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        if let uid = UserDefaults.standard.string(forKey: "id") {
            guard let pwd = UserDefaults.standard.string(forKey: "pwd") else { return }
            logindata(id: uid, password: pwd)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("auto=-=-=-=-\(LoginDone)=-=-=-=-")
                if LoginDone != true {
                    let alert = UIAlertController(title: "로그인에 실페했습니다.", message: "다시 확인하고 입력해 주세요.", preferredStyle: UIAlertController.Style.alert)
                    let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: false)
                    LoginDone = true
                } else {
                    TokenReissue()
                    let vcName = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
                    vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
                    vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
                    Toast(text: "자동으로 로그인 되었습니다.").show()
                    self.present(vcName!, animated: true, completion: nil)
                }
            }
        }
        idTextField.delegate = self
        passWordTextField.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        setController()
    }
    @IBAction func signUpButton(_ sender: Any) {
    }
    @IBAction func signIn(sender: Any) {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            guard let user = user else { return }
            if error == nil {
                let googleemailAddress = user.profile?.email
                let googlename = user.profile?.name
                let googleImage = user.profile?.imageURL(withDimension: 175)
                
                info.id = googleemailAddress
                info.name = googlename
                info.image = googleImage
                
                print("emailAddress : \(String(describing: googleemailAddress))")
                print("user : \(String(describing: googlename))\nerror : \(String(describing: error))")
                
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondSignUpViewController")
                self.navigationController?.pushViewController(pushVC!, animated: true)
            } else {
                print("---Google Login Error : \(String(describing: error))")
            }
        }
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
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
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("main=-=-=-=-\(LoginDone)=-=-=-=-")
                if LoginDone != true {
                    let alert = UIAlertController(title: "로그인에 실페했습니다.", message: "다시 확인하고 입력해 주세요.", preferredStyle: UIAlertController.Style.alert)
                    let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: false)
                } else {
                    print("Auto Login!!")
                    UserDefaults.standard.set(id, forKey: "id")
                    UserDefaults.standard.set(password, forKey: "pwd")
                    let vcName = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
                    vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
                    vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
                    self.present(vcName!, animated: true, completion: nil)
                }
            }
        }
    }
    override func viewDidLayoutSubviews() {
        idTextField.borderStyle = .none
        passWordTextField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: idTextField.frame.size.height-1, width: idTextField.frame.width, height: 1)
        border.backgroundColor = UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1).cgColor
        let border2 = CALayer()
        border2.frame = CGRect(x: 0, y: idTextField.frame.size.height-1, width: idTextField.frame.width, height: 1)
        border2.backgroundColor = UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1).cgColor
        idTextField?.backgroundColor = UIColor.clear
        idTextField.layer.addSublayer(border2)
        idTextField.textAlignment = .left
        idTextField.textColor = .label
        passWordTextField?.backgroundColor = UIColor.clear
        passWordTextField.layer.addSublayer(border)
        passWordTextField.textAlignment = .left
        passWordTextField.textColor = .label
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func loginAlert(title : String) {
        let alert = UIAlertController(title: "\(title)", message: "다시 입력해 주세요.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(defaultAction)
        self.present(alert, animated: false)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.idTextField {
            passWordTextField.becomeFirstResponder()
        }
        if textField == self.passWordTextField{
            self.loginButton(self.LoginPress)
        }
        return true
    }
    func setController() {
     
            self.title = ""
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)]
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.accessibilityNavigationStyle = .automatic
            appearance.backgroundColor = UIColor.white
            appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)]
            let proxy = UINavigationBar.appearance()
            proxy.tintColor = UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)
            proxy.standardAppearance = appearance
                proxy.scrollEdgeAppearance = appearance
            self.navigationController?.navigationBar.standardAppearance = appearance;
            self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.scrollEdgeAppearance
    }
}
