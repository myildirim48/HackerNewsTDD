//
//  HomeViewController.swift
//  HackerNewsTDD
//
//  Created by YILDIRIM on 4.06.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var articles = [Article]()
    var tableView = UITableView()
    let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "HackerNews"
        configureTableView()
        
        Task {
            await fetchData()
        }
    }
    //MARK: - Helpers
    private func configureTableView(){
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.frame
    }
    
    //MARK: - API
    
    private func fetchData() async {
        do {
            try await networkManager.fetchHomeViewArticles()
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
//MARK: - TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
