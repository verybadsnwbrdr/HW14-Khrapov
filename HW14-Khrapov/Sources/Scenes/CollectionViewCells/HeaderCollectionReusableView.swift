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
    var isHeaderButton = false
    
    // MARK: - Outlets
    
    private lazy var grayLine: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray3
        return line
    }()
    
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
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(grayLine)
        addSubview(title)
        addSubview(rightButton)
    }
    
    private func setupLayout() {
        grayLine.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.left.equalTo(snp.left).offset(5)
            make.right.equalTo(snp.right).offset(-5)
            make.height.equalTo(0.2)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(grayLine.snp.bottom).offset(10)
            make.left.equalTo(snp.left).offset(5)
        }
        
        rightButton.snp.makeConstraints { make in
            make.right.equalTo(snp.right).offset(-5)
            make.centerY.equalTo(title.snp.centerY)
        }
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        isHeaderButton = false
    }
}
