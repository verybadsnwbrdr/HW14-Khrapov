//
//  Extensions.swift
//  HW14-Khrapov
//
//  Created by Anton on 06.09.2022.
//

import UIKit

extension AlbumsViewController {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        let viewWidth = view.frame.width
        
        // Cell items offsets
        
        let horizontalItemsOffset: CGFloat = 5
        let topItemsOffset: CGFloat = 5
        let bottomItemsOffset: CGFloat = 50
        
        // Cell groups offsets
        
        let horizontalGroupOffset: CGFloat = 15
        let verticalGroupOffset: CGFloat = 5
        
        // Cell group width and height
        
        let groupWidth = (viewWidth - 3 * horizontalItemsOffset - horizontalGroupOffset) / viewWidth / 2
        let groupHeight = (viewWidth + bottomItemsOffset + topItemsOffset) / viewWidth
        
        // Header height
        
        let headerHeight: CGFloat = 45
        
        // Table rows offsets
        
        let horizontalRowsOffset: CGFloat = 0
        let verticalRowsOffset: CGFloat = 5
        
        // Table groups offset
        
        let tableHorizontalOffset: CGFloat = 0
        let tableTopOffset: CGFloat = 5
        let tableBottomOffset: CGFloat = 20
        
        
        
        return UICollectionViewCompositionalLayout { [self] sectionIndex, _ in
            let model = cellSources[sectionIndex]
            
            switch model {
            case .myAlbums(_, _):
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalWidth(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: topItemsOffset,
                                                                   leading: horizontalItemsOffset,
                                                                   bottom: bottomItemsOffset,
                                                                   trailing: horizontalItemsOffset)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupWidth),
                                                       heightDimension: .fractionalWidth(groupHeight))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                   subitem: layoutItem,
                                                                   count: 2)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: verticalGroupOffset,
                                                                      leading: horizontalGroupOffset,
                                                                      bottom: verticalGroupOffset,
                                                                      trailing: horizontalGroupOffset)
                layoutSection.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .absolute(viewWidth),
                                                                     heightDimension: .estimated(headerHeight))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
                
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
                
            case .peopleAndPlaces(_, _):
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalWidth(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: topItemsOffset,
                                                                   leading: horizontalItemsOffset,
                                                                   bottom: bottomItemsOffset,
                                                                   trailing: horizontalItemsOffset)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupWidth),
                                                       heightDimension: .fractionalWidth(groupHeight / 2))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                     subitem: layoutItem, count: 1)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: verticalGroupOffset,
                                                                      leading: horizontalGroupOffset,
                                                                      bottom: verticalGroupOffset,
                                                                      trailing: horizontalGroupOffset)
                
                layoutSection.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .absolute(viewWidth),
                                                                     heightDimension: .estimated(headerHeight))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
                
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
            
            case let .mediaTypes(_, rows), let .other(_, rows):
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: verticalRowsOffset,
                                                                   leading: horizontalRowsOffset,
                                                                   bottom: verticalRowsOffset,
                                                                   trailing: horizontalRowsOffset)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .estimated(CGFloat(44 * rows.count)))
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                     subitems: [layoutItem])
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: tableTopOffset,
                                                                      leading: tableHorizontalOffset,
                                                                      bottom: tableBottomOffset,
                                                                      trailing: tableHorizontalOffset)
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                     heightDimension: .estimated(headerHeight))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
                layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: horizontalRowsOffset,
                                                                            leading: horizontalGroupOffset,
                                                                            bottom: horizontalRowsOffset,
                                                                            trailing: horizontalRowsOffset)
                
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
            }
        }
    }
}
