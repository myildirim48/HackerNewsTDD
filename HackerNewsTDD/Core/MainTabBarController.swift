//
//  MainTabBarController.swift
//  HackerNewsTDD
//
//  Created by YILDIRIM on 5.06.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
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
        configureTabbar()
    }
    
    func configureTabbar() {

        
        let vc1 = HomeViewController(networkManager: networkManager)
        let vc2 = SearchViewController()
        let vc3 = FavoritesViewController()
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.image = UIImage(systemName: "heart")
        
        tabBar.tintColor = .label
        tabBar.barTintColor = .systemGray6
        
        setViewControllers([nav1,nav2,nav3], animated: true)
    }
}
