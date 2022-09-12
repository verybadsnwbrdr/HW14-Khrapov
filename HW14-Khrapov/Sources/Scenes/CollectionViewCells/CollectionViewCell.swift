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
    
    private lazy var peopleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PeopleCollectionViewCell.self, forCellWithReuseIdentifier: PeopleCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
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
            make.right.bottom.equalTo(self)
        }
        
        subImage.snp.makeConstraints { make in
            make.left.equalTo(photoImage.snp.left).offset(5)
            make.bottom.equalTo(photoImage.snp.bottom).offset(-5)
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
    
    private func setupPeopleCell() {
        if cellSource?.peopleCellImages != nil {
            addSubview(peopleCollectionView)
            
            peopleCollectionView.snp.makeConstraints { make in
                make.left.top.right.bottom.equalTo(photoImage)
            }
        }
    }
}

extension CollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCollectionViewCell.identifier, for: indexPath) as? PeopleCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.cellSource = cellSource?.peopleCellImages![indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: frame.height / 2 - 5, height: frame.height / 2 - 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
