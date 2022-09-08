//
//  LabelsCollectionViewCell.swift
//  HW14-Khrapov
//
//  Created by Anton on 08.09.2022.
//

import UIKit

class LabelsCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "LabelsCell"
    
    var cellSource: CellSources? {
        didSet {
//            photoImage.image = UIImage(named: cellSource!.image)
//            cellLabel.text = cellSource?.label
//            numberOfPhotos.text = "\(cellSource!.numberOfPhotos)"
        }
    }
    
    // MARK: - Elements
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
    
    private lazy var cellLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var numberOfPhotos: UILabel = {
        let label = UILabel()
        label.textColor = .gray
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
        addSubview(plusButton)
        addSubview(cellLabel)
        addSubview(numberOfPhotos)
    }
    
    private func setupLayout() {
        plusButton.snp.makeConstraints { make in
            make.center.equalTo(snp.center)
            make.left.top.equalTo(self)
            make.right.bottom.equalTo(self)
        }
        
        cellLabel.snp.makeConstraints { make in
            make.left.equalTo(plusButton)
            make.top.equalTo(plusButton.snp.bottom)
        }
        
        numberOfPhotos.snp.makeConstraints { make in
            make.left.equalTo(cellLabel)
            make.top.equalTo(cellLabel.snp.bottom)
        }
    }
}
