//
//  TabBarViewController.swift
//  HW14-Khrapov
//
//  Created by Anton on 05.09.2022.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Initializers

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupController()
        setupViewControllers()
    }
    
    // MARK: - Setup
    
    private func setupController() {

    }
    
    private func setupViewControllers() {
        let media = WhiteViewController()
        let mediaIcon = UITabBarItem(title: "Медиатека",
                                     image: UIImage(systemName: "photo.on.rectangle"),
                                     selectedImage: UIImage(systemName: "photo.on.rectangle.fill"))
        media.tabBarItem = mediaIcon
        
        let forYou = WhiteViewController()
        let forYouIcon = UITabBarItem(title: "Для Вас",
                                      image: UIImage(systemName: "heart.text.square"),
                                      selectedImage: UIImage(systemName: "heart.text.square.fill"))
        forYou.tabBarItem = forYouIcon
        
//        let albums = AlbumsViewController()
        let viewController = AlbumsViewController()
        let albums = UINavigationController(rootViewController: viewController)
        let albumsIcon = UITabBarItem(title: "Альбомы",
                                      image: UIImage(systemName: "rectangle.stack"),
                                      selectedImage: UIImage(systemName: "rectangle.stack.fill"))
        albums.tabBarItem = albumsIcon
        
        let search = WhiteViewController()
        let searchIcon = UITabBarItem(title: "Поиск",
                                      image: UIImage(systemName: "magnifyingglass"),
                                      selectedImage: UIImage(systemName: "magnifyingglass.fill"))
        search.tabBarItem = searchIcon
        
        let controllers = [media, forYou, albums, search]
        self.setViewControllers(controllers, animated: true)
    }
}
