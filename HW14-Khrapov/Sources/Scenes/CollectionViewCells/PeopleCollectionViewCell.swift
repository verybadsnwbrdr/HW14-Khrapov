//
//  PeopleCollectionViewCell.swift
//  HW14-Khrapov
//
//  Created by Anton on 11.09.2022.
//

import UIKit
import SnapKit

class PeopleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PeopleCoolectionViewCell"
    
    var cellSource: String? {
        didSet {
            cellImage.image = UIImage(named: cellSource ?? "transparent")
        }
    }
    
    // MARK: - Elements
    
    private lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = self.frame.width / 2
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
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
        addSubview(cellImage)
    }
    
    private func setupLayout() {
        cellImage.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(self)
        }
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImage.image = nil
    }
}
