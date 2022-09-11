//
//  ViewController.swift
//  HW14-Khrapov
//
//  Created by Anton on 05.09.2022.
//

import UIKit
import SnapKit

class AlbumsViewController: UIViewController {
    
    var cellSources = CellSources.cellSources
    
    // MARK: - Elements
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.register(TablesCollectionViewCell.self, forCellWithReuseIdentifier: TablesCollectionViewCell.identifier)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private lazy var plusButton: UIBarButtonItem = {
        let button = UIButton(type: .system)
        let barButton = UIBarButtonItem(customView: button)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return barButton
    }()
    
    // MARK: - Initializers

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = plusButton
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view)
        }
    }
}

extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        cellSources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0, 1: return cellSources[section].count
        default: return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0, 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
            cell.cellSource = cellSources[indexPath.section][indexPath.item]
            return cell

        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TablesCollectionViewCell.identifier, for: indexPath) as! TablesCollectionViewCell
            cell.currentSection = indexPath.section
            cell.cellSource = cellSources
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        
        switch indexPath.section {
        case 0: header.title.text = "Мои Альбомы"
            header.rightButton.isHidden = false
        case 1: header.title.text = "Люди и места"
            header.rightButton.isHidden = true
        case 2: header.title.text = "Типы медиафайлов"
            header.rightButton.isHidden = true
        case 3: header.title.text = "Другое"
            header.rightButton.isHidden = true
        default: break
        }
        
        return header
    }
}
