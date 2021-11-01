//
//  MeetingHomeViewController.swift
//  MiniTown
///Users/kimdaehee/Desktop/MiniTown/MiniTown/ViewController/FindMeeting
//  Created by 김대희 on 2021/10/19.
//

import UIKit
import Alamofire

var MainCount = Int()
var chattingRoom = [ChattingRoom]()

class MeetingHomeViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mettingModelParse()
        tableView.reloadData()
        let indexPath = NSIndexPath(row: NSNotFound, section: 0)
        self.tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: false)
        
        setSearchController()
    }
    override func viewWillAppear(_ animated: Bool) {
        mettingModelParse()
        tableView.reloadData()
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
        
        self.title = "모임 찾기"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)]
        navigationItem.hidesSearchBarWhenScrolling = false
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "모임을 검색하세요"
        searchController.searchBar.scopeButtonTitles = [ "전체", "공부", "운동", "음악", "창작" ]
        searchController.searchBar.showsScopeBar = true
        self.navigationItem.searchController = searchController
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            if let vc = segue.destination as? DetailMettingViewController{
                vc.detailIndex = indexPath.row
                
            }
        }
    }
    
}
extension MeetingHomeViewController :  UITableViewDelegate, UITableViewDataSource {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("=-=-=-=-=-=-=-==-")
        mettingModelParse()
        print(MainCount)
        return chattingRoom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mettingCell", for: indexPath) as! MettingTableViewCell
        cell.titleTextLable.text = chattingRoom[indexPath.row].name
        cell.locationLabel.text = chattingRoom[indexPath.row].admin
        cell.infoLabel.text = chattingRoom[indexPath.row].info
        if chattingRoom[indexPath.row].Image == nil {
            let url2 = URL(string: "https://dummyimage.com/500x500/e5e5e5/000000&text=No+Image")!
            let ImageData = try! Data(contentsOf: url2)
            cell.MainImage.image = (UIImage(data: ImageData))
        } else {
            let url = URL(string: chattingRoom[indexPath.row].Image!)
            let ImageData = try! Data(contentsOf: url!)
            cell.MainImage.image = (UIImage(data: ImageData))
        }
        return cell
    }
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        performSegue(withIdentifier: "showDetail", sender: nil)
    //    }
}

