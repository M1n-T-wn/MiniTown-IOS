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

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
