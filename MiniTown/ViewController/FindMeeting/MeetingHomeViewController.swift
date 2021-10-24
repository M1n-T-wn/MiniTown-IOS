//
//  MeetingHomeViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/19.
//

import UIKit

class MeetingHomeViewController: UIViewController {
    

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchController()
    }
    
    @IBAction func backItemButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func profileButton(_ sender: Any) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    func setSearchController() {
        self.title = "모임 찾기"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)]
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "모임을 검색하세요"
        searchController.searchBar.scopeButtonTitles = [ "전체", "10대", "20대", "30대", "40대" ]
        searchController.searchBar.showsScopeBar = true
        self.navigationItem.searchController = searchController
    }
    
}

extension MeetingHomeViewController :  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MettingLable.mettingTitleLable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mettingCell", for: indexPath) as! MettingTableViewCell
        cell.titleTextLable.text = MettingLable.mettingTitleLable[indexPath.row]
        cell.locationLabel.text = MettingLable.mettingLocationLable[indexPath.row]
        cell.infoLabel.text = MettingLable.mettingInfoLable[indexPath.row]
        cell.MainImage.image = (UIImage(named: MettingLable.mettingImage[indexPath.row])!)
        return cell
    }
}
