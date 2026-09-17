//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Mouli Agastya on 9/14/26.
//

import XCTest
@testable import NewsApp

final class NewsAppTests: XCTestCase {
    var newsViewModel: NewsHomeViewModelProtocol?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        newsViewModel = MockNewsHomeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        newsViewModel = nil
    }
    
    func testGetTotalNewsCount() {
        let count = newsViewModel?.getTotalNewsCount()
        XCTAssertEqual(count, 0)
    }
    
    func testGetNews() {
        let news = newsViewModel?.getNews(for: 0)
        XCTAssertNil(news)
    }
    
    func testFetchNews() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch news completes")
        
        // When
        newsViewModel?.fetchNews {
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        
        // Verify count
        XCTAssertEqual(newsViewModel?.getTotalNewsCount(), 1)
        
        // Verify specific article data
        let article = newsViewModel?.getNews(for: 0)
        XCTAssertNotNil(article)
        XCTAssertEqual(article?.title, "Tesla: The Top Is Here")
        XCTAssertEqual(article?.publishedAt, "2020-02-05T15:47:40Z")
    }
}
