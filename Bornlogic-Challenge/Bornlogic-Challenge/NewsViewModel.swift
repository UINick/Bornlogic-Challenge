//
//  NewsViewModel.swift
//  Bornlogic-Challenge
//
//  Created by Nicholas Forte on 16/05/24.
//

import Foundation

class NewsViewModel {

    init() {}
    
    let newsArray: [TableViewCellModelProtocol] = [NewsItemModel(title: "", img: "")]
    
    func getCellModel(at index: Int) -> TableViewCellModelProtocol {
        return newsArray[index]
    }
}
