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
        
        collectionView.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.identifier)
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
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalWidth(0.55))
            
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 40, trailing: 5)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.46),
                                                   heightDimension: .fractionalHeight(0.63))
            
            let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                 subitem: layoutItem, count: 2)
            
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15)
            layoutSection.orthogonalScrollingBehavior = .continuous
            
            let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                 heightDimension: .estimated(20)
            )
            
            let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            
            layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
            
            return layoutSection
        }
    }
}

extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.identifier, for: indexPath) as! FirstCollectionViewCell
        cell.cellSource = cellSources[0][0]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        header.title.text = "Мои Альбомы"
        return header
    }
}
