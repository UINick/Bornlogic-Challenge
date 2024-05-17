//
//  NewsViewModel.swift
//  Bornlogic-Challenge
//
//  Created by Nicholas Forte on 16/05/24.
//

import Foundation

class NewsViewModel {

    init() {
        
    }
    
    var newsArray: [TableViewCellModelProtocol] = [NewsItemModel(title: "", img: "")]
    
    
    func getNews() async throws -> Result<ArticlesModel, Error>{
        let endPoint = "https://newsapi.org/v2/everything?q=keyword&apiKey=1e729326e7f7455e8449724608e34461"
        guard let url = URL(string: endPoint) else { throw NewsError.invalidUrl }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NewsError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(ArticlesModel.self, from: data)
            result.articles.forEach({
                print("Dados que retornaram = \($0.title)")
            })
            return .success(result)
        } catch {
            return .failure(NewsError.invalidResponse)
        }
    }
    
    func getCellModel(at index: Int)  -> TableViewCellModelProtocol {
        return newsArray[index]
    }
}

enum NewsError: Error {
    case invalidUrl
    case invalidResponse
}

struct ArticlesModel: Decodable {
    let articles: [NewsModel]
}

class NewsModel: Decodable {
    
    let author: String?
    let content: String?
    let description: String?
    let publishedAt: String?
    let title: String?
    let url: String?
    let urlToImage: String?

    enum CodingKeys: String, CodingKey {
        case author = "author"
        case content = "content"
        case description = "description"
        case publishedAt = "publishedAt"
        case title = "title"
        case url = "url"
        case urlToImage = "urlToImage"
    }
}

