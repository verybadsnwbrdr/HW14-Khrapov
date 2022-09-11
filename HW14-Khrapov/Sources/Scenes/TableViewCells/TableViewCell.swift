//
//  TableViewCell.swift
//  HW14-Khrapov
//
//  Created by Anton on 09.09.2022.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    var cellSource: CellSources? {
        didSet {
            cellImage.image = UIImage(systemName: cellSource?.image ?? "transparent")
            label.text = cellSource?.label
            self.detailTextLabel?.text = String(cellSource?.numberOfPhotos ?? 0)
        }
    }
    
    // MARK: - Elements
    
    private lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        return label
    }()
    
    // MARK: - Initiaziers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(cellImage)
        addSubview(label)
    }
    
    private func setupLayout() {
        cellImage.snp.makeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.width.height.equalTo(23)
            make.left.equalTo(snp.left).offset(20)
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.left.equalTo(cellImage.snp.right).offset(15)
        }
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .disclosureIndicator
        self.cellSource = nil
    }
}
