//
//  AlbumsCollectionReusableView.swift
//  HW14-Khrapov
//
//  Created by Anton on 08.09.2022.
//

import UIKit
import SnapKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "AlbumsHeader"
    
    // MARK: - Outlets
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Все", for: .normal)
        return button
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(title)
        addSubview(rightButton)
    }
    
    private func setupLayout() {
        title.snp.makeConstraints { make in
//            make.bottom.equalTo(self)
            make.centerY.equalTo(snp.centerY)
            make.left.equalTo(snp.left).offset(5)
        }
        
        rightButton.snp.makeConstraints { make in
            make.right.equalTo(snp.right).offset(-5)
            make.centerY.equalTo(title.snp.centerY)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}
