//
//  FirstCollectionViewCell.swift
//  HW14-Khrapov
//
//  Created by Anton on 06.09.2022.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    static var identifier = "CollectionViewCell"
    private lazy var peopleCellWidth = (self.frame.width - 2) / 2
    
    var cellSource: CellSources? {
        didSet {
            photoImage.image = UIImage(named: cellSource?.image ?? "transparent")
            cellLabel.text = cellSource?.label
            numberOfPhotos.text = "\(cellSource?.numberOfPhotos ?? 0)"
            subImage.image = UIImage(systemName: cellSource?.subImage ?? "transparent")
            setupPeopleCell()
        }
    }
    
    // MARK: - Elements
    
    private lazy var photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var numberOfPhotos: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var subImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(photoImage)
        addSubview(subImage)
        addSubview(cellLabel)
        addSubview(numberOfPhotos)
    }
    
    private func setupLayout() {
        photoImage.snp.makeConstraints { make in
            make.center.equalTo(snp.center)
            make.left.top.equalTo(self)
        }
        
        subImage.snp.makeConstraints { make in
            make.left.equalTo(photoImage.snp.left).offset(5)
            make.bottom.equalTo(photoImage.snp.bottom).offset(-5)
        }
        
        cellLabel.snp.makeConstraints { make in
            make.left.equalTo(photoImage)
            make.top.equalTo(photoImage.snp.bottom).offset(3)
        }
        
        numberOfPhotos.snp.makeConstraints { make in
            make.left.equalTo(cellLabel)
            make.top.equalTo(cellLabel.snp.bottom).offset(3)
        }
    }
    
    private func initPeopleCell() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = peopleCellWidth / 2
        imageView.clipsToBounds = true
        return imageView
    }
    
    private func setupPeopleCells() -> [UIImageView] {
        var result = [UIImageView]()
        if let peopleCellImages = cellSource?.peopleCellImages {
            for i in 0 ... 3 {
                result.append(initPeopleCell())
                addSubview(result[i])
                if i < peopleCellImages.count {
                    result[i].image = UIImage(named: peopleCellImages[i])
                }
            }
        }
        return result
    }
    
    private func setupPeopleCell() {
        if cellSource?.peopleCellImages != nil {
            let peopleCellImageViews = setupPeopleCells()
            
            peopleCellImageViews[0].snp.makeConstraints { make in
                make.left.top.equalTo(photoImage)
                make.width.height.equalTo(peopleCellWidth)
            }
            
            peopleCellImageViews[1].snp.makeConstraints { make in
                make.centerY.equalTo(peopleCellImageViews[0].snp.centerY)
                make.left.equalTo(peopleCellImageViews[0].snp.right).offset(2)
                make.width.height.equalTo(peopleCellWidth)
            }
            
            peopleCellImageViews[2].snp.makeConstraints { make in
                make.centerX.equalTo(peopleCellImageViews[0].snp.centerX)
                make.top.equalTo(peopleCellImageViews[0].snp.bottom).offset(2)
                make.width.height.equalTo(peopleCellWidth)
            }
            
            peopleCellImageViews[3].snp.makeConstraints { make in
                make.centerY.equalTo(peopleCellImageViews[2].snp.centerY)
                make.left.equalTo(peopleCellImageViews[2].snp.right).offset(2)
                make.width.height.equalTo(peopleCellWidth)
            }
        }
    }
}
