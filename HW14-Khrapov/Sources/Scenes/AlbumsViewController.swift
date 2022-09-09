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
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0:
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
                                                                     heightDimension: .estimated(30)
                )
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
                
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalWidth(0.55))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 40, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.46),
                                                       heightDimension: .fractionalHeight(0.63 / 2))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                     subitem: layoutItem, count: 1)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .continuous
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                     heightDimension: .estimated(30)
                )
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
            
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .estimated(360))
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                     subitems: [layoutItem])
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 20, trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .continuous
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                     heightDimension: .estimated(30)
                )
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
                
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .estimated(140))
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                     subitems: [layoutItem])
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 20, trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .continuous
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                     heightDimension: .estimated(30)
                )
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
            }
            
        }
    }
}

extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        cellSources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellSources[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0, 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
            cell.cellSource = cellSources[indexPath.section][indexPath.row]
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
