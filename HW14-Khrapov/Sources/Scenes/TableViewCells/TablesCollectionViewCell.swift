//
//  SecondCollectionViewCell.swift
//  HW14-Khrapov
//
//  Created by Anton on 09.09.2022.
//

import UIKit
import SnapKit

class TablesCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "TablesCollectionView"
    
    var cellSource = CellSources.cellSources
    var currentSection: Int?
    
    // MARK: - Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.isScrollEnabled = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
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
        addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(self)
            make.right.equalTo(snp.right).offset(-18)
        }
    }
}

extension TablesCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellSource[currentSection ?? 0].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.cellSource = cellSource[currentSection ?? 0][indexPath.row]
        return cell
    }
    
    
}
