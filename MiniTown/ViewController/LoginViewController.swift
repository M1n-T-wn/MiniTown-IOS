//
//  ViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/15.
//

import UIKit

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
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("=-=-=-=-\(LoginDone)=-=-=-=-")
                if LoginDone != true {
                    let alert = UIAlertController(title: "로그인에 실페했습니다.", message: "다시 확인하고 입력해 주세요.", preferredStyle: UIAlertController.Style.alert)
                    let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (action) in
                        return
                    }
                    alert.addAction(defaultAction)
                    self.present(alert, animated: false)
                } else {
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
        border.backgroundColor = UIColor.blue.cgColor
        let border2 = CALayer()
        border2.frame = CGRect(x: 0, y: idTextField.frame.size.height-1, width: idTextField.frame.width, height: 1)
        border2.backgroundColor = UIColor.blue.cgColor
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
    
}

class BottomLineTextField: UITextField {
    public var shapeLayer: CAShapeLayer! // 전역에 선언
    
    func addBottomView() {
        
        borderStyle = .none
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: bounds.size.height + 3))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.size.height + 3))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = path.lineWidth
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.strokeColor = UIColor.blue.cgColor
        layer.addSublayer(shapeLayer)
    }
}



