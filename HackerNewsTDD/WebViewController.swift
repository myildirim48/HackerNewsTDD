//
//  WebViewController.swift
//  HackerNewsTDD
//
//  Created by YILDIRIM on 5.06.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    //MARK: - Properties
    var pageUrl: URL!
    let webView = WKWebView()
    

    init(pageUrl: URL) {
        super.init(nibName: nil, bundle: nil)
        self.pageUrl = pageUrl
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavbar()
        configureWebView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = false
    }
    //MARK: - Helpers
    
    private func configureNavbar() {
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func configureWebView() {
        let urlRequest = URLRequest(url: pageUrl)
        webView.load(urlRequest)
        view = webView
    }
}
