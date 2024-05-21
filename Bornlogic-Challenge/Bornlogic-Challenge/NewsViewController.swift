//
//  NewsViewController.swift
//  Bornlogic-Challenge
//
//  Created by Nicholas Forte on 16/05/24.
//

import UIKit

class NewsViewController: UIViewController {
    
    private let viewModel = NewsViewModel()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        Task {
            let result = try await viewModel.getNews()
            switch result {
                case .success(let news):
                news.articles.forEach({
                    viewModel.newsArray.append(NewsItemModel(title: $0.title!, img: $0.urlToImage ?? ""))
                })
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                case .failure(let error):
                print("erro = \(error.localizedDescription)")
            }
        }
    }
}

extension NewsViewController: UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellModel = viewModel.getCellModel(at: indexPath.row)
        cellModel.index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.cellIdentifier) as? TableViewCellProtocol
        cell?.bind(with: cellModel)
        return cell as? UITableViewCell ?? UITableViewCell()
    }
    
    
}

