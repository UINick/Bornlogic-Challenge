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
        view.backgroundColor = UIColor.systemBrown
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 6
        view.layer.shadowOpacity = 0.17
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        return view
    }()
    
    lazy var newsTitle: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    lazy var viewImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 4
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    func setUpLayout() {
        self.contentView.addSubview(cellContentView)
        self.cellContentView.addSubview(newsTitle)
        self.cellContentView.addSubview(viewImage)
        
        
        self.cellContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellContentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cellContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cellContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            cellContentView.heightAnchor.constraint(equalToConstant: 90.0)
        ])
        
        self.newsTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsTitle.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: 20),
            newsTitle.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 10),
            newsTitle.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -10)
        ])
    }
    
    func setEvenLayout() {
        //impar
        NSLayoutConstraint.deactivate(viewImage.constraints)
        self.viewImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewImage.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: 10),
            viewImage.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -10),
            viewImage.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -10),
            viewImage.widthAnchor.constraint(equalTo: cellContentView.widthAnchor, multiplier: 0.5),
            viewImage.heightAnchor.constraint(equalToConstant: 45.0)
        ])
    }
    
    func setOddsLayout() {
        //par
        NSLayoutConstraint.deactivate(viewImage.constraints)
        self.viewImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewImage.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: 10),
            viewImage.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 10),
            viewImage.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -10),
            viewImage.widthAnchor.constraint(equalTo: cellContentView.widthAnchor, multiplier: 0.5),
            viewImage.heightAnchor.constraint(equalToConstant: 45.0)
        ])
    }
}

extension NewsCell: TableViewCellProtocol {
    func bind(with data: TableViewCellModelProtocol) {
        if let model = data as? NewsItemModel {
            self.newsTitle.text = model.title
            self.viewImage.load(urlString: model.img)
            if model.index! % 2 == 0 {
                setOddsLayout()
            } else {
                setEvenLayout()
            }
        }
    }
}
