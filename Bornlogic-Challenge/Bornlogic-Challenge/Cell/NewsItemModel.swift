//
//  NewsItemModel.swift
//  Bornlogic-Challenge
//
//  Created by Nicholas Forte on 16/05/24.
//

import Foundation

struct NewsItemModel: TableViewCellModelProtocol {
    var cellIdentifier: String = "NewsCell"
    var index: Int?
    let title: String
    let img: String
}
