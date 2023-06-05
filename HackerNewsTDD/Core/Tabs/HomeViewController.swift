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
        navigationItem.title = "HackerNews"
        navigationController?.navigationBar.prefersLargeTitles = true
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
        
        let refreshController = UIRefreshControl()
        refreshController.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.refreshControl = refreshController
    }
    
    //MARK: - Actions
    @objc func handleRefresh() {
        Task {
            await fetchData()
        }
    }
    
    //MARK: - API
    
    private func fetchData() async {
        do {
           let results = try await networkManager.fetchHomeViewArticles()
            self.articles = results
            await MainActor.run {
                tableView.reloadData()
                tableView.refreshControl?.endRefreshing()
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
//MARK: - TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let selectedUrl = articles[indexPath.row].url else { return }
        guard let pageUrl = URL(string: selectedUrl) else { return }
        
        let webView = WebViewController(pageUrl: pageUrl)
        navigationController?.pushViewController(webView, animated: true )
    }
}
