//
//  MainSettingViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/24.
//

import UIKit
import Toaster

class MainSettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func darkButton(_ sender: Any) {
    }
    @IBAction func notiButton(_ sender: Any) {
    }
    @IBAction func logOutButton(_ sender: Any) {
        print("delete id, pwd")
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "pwd")
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "LoginNavigation")
        vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
        vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
        Toast(text: "로그아웃 되었습니다.").show()
        self.present(vcName!, animated: true, completion: nil)
    }
    
    func setController() {
        self.title = "설정"
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
