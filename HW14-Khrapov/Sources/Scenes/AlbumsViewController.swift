//
//  ViewController.swift
//  HW14-Khrapov
//
//  Created by Anton on 05.09.2022.
//

import UIKit
import SnapKit

class AlbumsViewController: UIViewController {
    
    var cellSources = Models.models
    
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
        switch cellSources[section] {
        case let .myAlbums(_, rows): return rows.count
        case let .peopleAndPlaces(_, rows): return rows.count
        default: return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = cellSources[indexPath.section]
        switch model {
        case let .myAlbums(_, items), let .peopleAndPlaces(_, items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.cellSource = items[indexPath.item]
            return cell
            
        case let .mediaTypes(_, rows), let .other(_, rows):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TablesCollectionViewCell.identifier, for: indexPath) as? TablesCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.cellSource = rows
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let model = cellSources[indexPath.section]
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView else {
            return UICollectionReusableView()
        }
        
        switch model {
        case let .myAlbums(source, _),
             let .peopleAndPlaces(source, _),
             let .mediaTypes(source, _),
             let .other(source, _):
            
            header.title.text = source.label
            header.rightButton.isHidden = source.isHiddenRightButton
        }
        
        return header
    }
}
