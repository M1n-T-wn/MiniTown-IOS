//
//  MeetingHomeViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/19.
//

import UIKit

class MeetingHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "모임 찾기"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)]
        // Do any additional setup after loading the view.
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
