//
//  MockNewsHomeViewModel.swift
//  NewsApp
//
//  Created by Mouli Agastya on 9/16/26.
//

class MockNewsHomeViewModel: NewsHomeViewModelProtocol {
    var newsList: News?
    
    func fetchNews(completion: @escaping () -> ()) {
        let news = News(
            articles: [
                Article(title: "Tesla: The Top Is Here", description: "To say that Tesla has been on fire lately is an understatement. The stock has gone parabolic, Bitcoin like, vertical in recent weeks.The company's market cap is now around $160 billion, and its projected 2020 P/E multiple is roughly 113. Stocks cannot continue", urlToImage: "https://static.seekingalpha.com/uploads/2020/2/5/48200183-15809104384836764_origin.jpg", publishedAt: "2020-02-05T15:47:40Z")
            ]
        )
        self.newsList = news
        completion()
    }
    
    func getTotalNewsCount() -> Int {
        newsList?.articles.count ?? 0
    }
    
    func getNews(for index: Int) -> Article? {
        guard let news = newsList, index < news.articles.count else { return nil }
        return newsList?.articles[index]
    }
}
