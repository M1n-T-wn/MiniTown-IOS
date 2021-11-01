//
//  RentalItemsHomeViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/30.
//

import UIKit

class RentalItemsHomeViewController: UIViewController {
    
    @IBOutlet weak var ItemsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ItemsTableView.delegate = self
        ItemsTableView.dataSource = self
        setVC()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
//        ItemsTableView.separatorStyle = .none
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func detailMenuButton(_ sender: Any) {
    }
    
    func setVC()  {
        
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
        
        self.title = "물품 대여"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)]
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "물품을 검색하세요"
        
        self.navigationItem.searchController = searchController
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
extension RentalItemsHomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MettingLable.mettingTitleLable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RemtItemsList", for: indexPath) as! RemtItemsListTableViewCell
        cell.ItemMainImage.image = (UIImage(named: MettingLable.mettingImage[indexPath.row])!)
        cell.TitleLabel.text = MettingLable.mettingTitleLable2[indexPath.row]
        cell.DateLabel.text = "2021.10.30 12:04"
        cell.CostLabel.text = "요청금액 : \(MettingLable.mettingLocationLabl2[indexPath.row])원"
        return cell
    }
    
    
}
