//
//  3rdSignUpViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/29.
//

import UIKit
import MapKit

class ThirdSignUpViewController: UIViewController {
    
    @IBOutlet weak var zoneCodeField: UITextField!
    @IBOutlet weak var jibunAddressField: UITextField!
    @IBOutlet weak var detailAddressField: UITextField!
    @IBOutlet weak var addressPress: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addressPress.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)

        zoneCodeField.text = info.zoneCode
        jibunAddressField.text = info.jibunAddress
    }
    override func viewWillAppear(_ animated: Bool) {
        zoneCodeField.text = info.zoneCode
        jibunAddressField.text = info.jibunAddress
    }
    override func viewDidAppear(_ animated: Bool) {
        sss()
    }
    @IBAction func returnHomeButton(_ sender: Any) {
//        guard let zoneCodeField = zoneCodeField.text else { return }
//        guard let jibunAddressField = jibunAddressField.text else { return }
        guard let detailAddressField = detailAddressField.text else { return }

        info.detailAddress = detailAddressField
//        info.jibunAddress = jibunAddressField
//        info.zoneCode = zoneCodeField
        if info.keyadress == nil {
            alert(title: "주소 검색을 하지 않았습니다.", message: "주소 검색하기 버튼을 클릭하고 지역을 검색해주세요! ")
        }
        if info.zoneCode == "" {
            alert(title: "우편번호가 입력되지 않았습니다.", message: "주소를 검색해 우편번호를 입력하세요")
        }
        if info.jibunAddress == "" {
            alert(title: "지번이 입려되지 않았습니다.", message: "주소를 검색해 지번을 입력하세요")
        }
        if info.detailAddress == "" {
            alert(title: "상세주소가 입력되지 않았습니다.", message: "상세주소를 입력하세요")
        } else {
            print(info.id as Any, info.phone  as Any, info.birth  as Any, info.gender  as Any,  info.name  as Any, info.password  as Any)
            signupdata(birth: info.birth!, gender: info.gender!, id: info.id!, loginType: info.loginType!, name: info.name!, password: info.password!, phone: info.phone!)
            let vcName = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
            vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
            vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
            self.present(vcName!, animated: true, completion: nil)
        }
    }
    func alert(title : String, message : String) {
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(defaultAction)
        self.present(alert, animated: false)
    }
    @objc
    private func handleButton(_ sender: UIButton) {
        print(#function)
        let nextVC = WKViewController()
        present(nextVC, animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    func sss() {
        jibunAddressField?.text = info.jibunAddress
        zoneCodeField?.text = info.zoneCode

    }
}
