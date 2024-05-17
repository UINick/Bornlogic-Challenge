//
//  TableViewCellProtocol.swift
//  Bornlogic-Challenge
//
//  Created by Nicholas Forte on 16/05/24.
//

import Foundation

protocol TableViewCellProtocol {
    func bind(with data: TableViewCellModelProtocol)
}

protocol TableViewCellModelProtocol {
    var cellIdentifier: String { get }
    var index: Int? {get}
}
