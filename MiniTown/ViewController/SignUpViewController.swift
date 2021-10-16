//
//  SignUpViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/16.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var SidField: UITextField!
    @IBOutlet weak var SpwField: UITextField!
    @IBOutlet weak var SrpwField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func LoginPageButton(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }
}
