//
//  ChatRoomViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/27.
//

import UIKit
import QuartzCore

class ChatRoomViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var chatStringTextView: UITextView!
    @IBOutlet weak var inputViewButtomMargin: NSLayoutConstraint!
    @IBOutlet weak var textViewHeiget: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.delegate = self
        chatStringTextView.delegate = self
        chatTableView.dataSource = self
        chatTableView.separatorStyle = .none
        setController()
        
        // 사용하려는 셀을 등록하는 register
        chatTableView.register(UINib(nibName: "ChatMyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        chatTableView.register(UINib(nibName: "ChatYourTableViewCell", bundle: nil), forCellReuseIdentifier: "YourCell")
        // 키보드 관련 옵져버
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        setController()
        chatTableView.separatorStyle = .none
    }
    @IBAction func sendDataButton(_ sender: Any) {
        if chatStringTextView.text.isEmpty {
            return
        }
        else {
            chatDatas.append(chatStringTextView.text)
            chatStringTextView.text = ""
            let lastindexPath = IndexPath(row: chatDatas.count - 1, section: 0)
            chatTableView.insertRows(at: [lastindexPath], with: UITableView.RowAnimation.automatic)
            textViewHeiget.constant = 35
            chatTableView.scrollToRow(at: lastindexPath, at: UITableView.ScrollPosition.bottom, animated: true)
        }

    }
    
    @objc func keyboardWillShow(noti: Notification) {
        let notinfo = noti.userInfo!
        let keyboardFrame = notinfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let heiget = keyboardFrame.size.height - self.view.safeAreaInsets.bottom
        let animateDuration = notinfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        UIView.animate(withDuration: animateDuration) {
            self.inputViewButtomMargin.constant = heiget
            self.view.layoutIfNeeded()
        }
    }
    
    @objc
    func keyboardWillHide(noti: Notification) {
        let notinfo = noti.userInfo!
        let animateDuration = notinfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        UIView.animate(withDuration: animateDuration) {
            self.inputViewButtomMargin.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        if textView.contentSize.height <= 35 {
            textViewHeiget.constant = 35
        }
        else if textView.contentSize.height >= 100 {
            textViewHeiget.constant = 100
        } else {
            textViewHeiget.constant = textView.contentSize.height
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "내용을 입력하세요."
            textView.textColor = UIColor.lightGray
        }
    }
    func setController() {
        chatStringTextView.text = "내용을 입력하세요."
        chatStringTextView.textColor = UIColor.lightGray
        chatStringTextView.layer.cornerRadius = 5
        
        self.title = "이름입니다."
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        let proxy = UINavigationBar.appearance()
        proxy.tintColor = .white
        proxy.standardAppearance = appearance
            proxy.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.standardAppearance = appearance;
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
    }
}

extension ChatRoomViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let mycell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! ChatMyTableViewCell
            mycell.chatMyTextView.text = chatDatas[indexPath.row]
            mycell.selectionStyle = .none
            return mycell
        } else {
            let yourcell = tableView.dequeueReusableCell(withIdentifier: "YourCell", for: indexPath) as! ChatYourTableViewCell
            yourcell.chatYourTextView.text  = chatDatas[indexPath.row]
            yourcell.selectionStyle = .none
            return yourcell
        }
    }
}
