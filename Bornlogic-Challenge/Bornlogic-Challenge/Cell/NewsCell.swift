//
//  NewsCell.swift
//  Bornlogic-Challenge
//
//  Created by Nicholas Forte on 16/05/24.
//

import Foundation
import UIKit

class NewsCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var newsTitle: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    func setUpLayout() {
        self.contentView.addSubview(cellContentView)
        self.cellContentView.addSubview(newsTitle)
        
        self.cellContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellContentView.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        self.newsTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsTitle.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: 20),
            newsTitle.leadingAnchor.constraint(equalTo: newsTitle.leadingAnchor, constant: 10),
        ])
    }
}

extension NewsCell: TableViewCellProtocol {
    func bind(with data: TableViewCellModelProtocol) {
        if let model = data as? NewsItemModel {
            self.newsTitle.text = model.title
        }
    }
}
