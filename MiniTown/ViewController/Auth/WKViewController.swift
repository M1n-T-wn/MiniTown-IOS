//
//  WKViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/29.
//

import UIKit
import WebKit

class WKViewController: UIViewController {
    
    var webView: WKWebView?
    let indicator = UIActivityIndicatorView(style: .medium)
    var address = ""
    var zonecode = ""
    var keyadress = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        setAttributes()
        setContraints()
    }
    
    private func setAttributes() {
        let contentController = WKUserContentController()
        contentController.add(self, name: "callBackHandler")
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = contentController
        
        webView = WKWebView(frame: .zero, configuration: configuration)
        webView?.navigationDelegate = self
        
        guard let url = URL(string: "https://kimbuckgur.github.io/Kakao-Postcode/"),
              let webView = webView
        else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        indicator.startAnimating()
    }
    
    private func setContraints() {
        guard let webView = webView else { return }
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        webView.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            indicator.centerXAnchor.constraint(equalTo: webView.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: webView.centerYAnchor),
        ])
    }
}

extension WKViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
        if let data = message.body as? [String: Any] {
            print(data)
            address = data["jibunAddress"] as? String ?? ""
            zonecode  = data["zonecode"] as? String ?? ""
            keyadress = data["roadAddress"] as? String ?? ""
            info.keyadress = keyadress
            info.jibunAddress = address
            info.zoneCode = zonecode
            print(info.keyadress as Any, zonecode, keyadress)
        }
        info.jibunAddress = address
        info.zoneCode = zonecode
        ThirdSignUpViewController().sss()
        self.dismiss(animated: true, completion: nil)
        let previousVC = presentingViewController as? ThirdSignUpViewController
        previousVC?.jibunAddressField.text = address
        previousVC?.zoneCodeField.text = zonecode
        info.jibunAddress = address
        info.zoneCode = zonecode
        ThirdSignUpViewController().sss()

        
        
    }
}
extension WKViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
    
}
