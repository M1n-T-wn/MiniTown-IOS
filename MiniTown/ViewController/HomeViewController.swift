//
//  HomeViewControiier.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/18.
//

import UIKit
import QuartzCore
import Alamofire

var qwqwname = ""
var qwqwinfo = ""


class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var homeProfileImage: UIImageView!
    
    @IBOutlet weak var mainInfoLabel: UILabel!
    @IBOutlet weak var subInfoLabel: UILabel!
    
    @IBOutlet var chatTableView: UITableView!
    override func viewDidLoad() {
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        AF.request(baseURL + "/api/mypage", method: .get,  headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                print("=-=-=-=-")
                print(response)
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    do {
                        let resault = try decoder.decode(myPage.self, from: data)
                        print(resault)
                        let ImageData = try Data(contentsOf: resault.data.profile)
                        
                        self.mainInfoLabel.text = resault.data.name
                        self.subInfoLabel.text = resault.data.info
                        self.homeProfileImage.image = UIImage(data: ImageData)
                        
                        qwqwname = "\(resault.data.name) (\(resault.data.gender))"
                        qwqwinfo = resault.data.info ?? "자기소재를 입력하지 않앗습니다."
                    }
                    catch {
                        print(error)
                    }
                case .failure(let error):
                    print("Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
                }
            }
        super.viewDidLoad()
        mettingModelParse()
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        homeProfileImage.layer.cornerRadius = homeProfileImage.frame.height/2
        homeProfileImage.layer.borderWidth = 1
        homeProfileImage.layer.borderColor = UIColor.clear.cgColor
        homeProfileImage.clipsToBounds = true
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.mainInfoLabel.text = qwqwname
            self.subInfoLabel.text = qwqwinfo
        }
    }
    @IBAction func findMettingButton(_ sender: Any) {
        
    }
    
    @IBAction func reservationLocationButton(_ sender: Any) {
    }
    
    @IBAction func rentalItemsButton(_ sender: Any) {
    }
    
    @IBAction func settengsButton(_ sender: Any) {
    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MettingLable.mettingTitleLable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatRoomCell", for: indexPath) as! ChatroomListTableViewCell
        cell.titleLabel.text = MettingLable.mettingTitleLable[indexPath.row]
        cell.chatMessageLabel.text = MettingLable.mettingChatNessage[indexPath.row]
        cell.titleImage.image = (UIImage(named: MettingLable.mettingImage[indexPath.row])!)
        //        cell.infoLabel.text = MettingLable.mettingInfoLable[indexPath.row]
        return cell
    }
    
}
