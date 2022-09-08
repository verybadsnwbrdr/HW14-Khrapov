//
//  FirstCollectionViewCell.swift
//  HW14-Khrapov
//
//  Created by Anton on 06.09.2022.
//

import UIKit
import SnapKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "FirstCell"
    
    var cellSource: CellSources? {
        didSet {
            photoImage.image = UIImage(named: cellSource!.image)
            cellLabel.text = cellSource?.label
            numberOfPhotos.text = "\(cellSource!.numberOfPhotos)"
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
        addSubview(cellLabel)
        addSubview(numberOfPhotos)
    }
    
    private func setupLayout() {
        photoImage.snp.makeConstraints { make in
            make.center.equalTo(snp.center)
            make.left.top.equalTo(self)
            make.right.bottom.equalTo(self)
        }
        
        cellLabel.snp.makeConstraints { make in
            make.left.equalTo(photoImage)
            make.top.equalTo(photoImage.snp.bottom)
        }
        
        numberOfPhotos.snp.makeConstraints { make in
            make.left.equalTo(cellLabel)
            make.top.equalTo(cellLabel.snp.bottom)
        }
    }
}
