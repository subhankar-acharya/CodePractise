//
//  NetworkManagerExtraKeysTest.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 9/30/25.
//

import XCTest
@testable import GHFollowers

final class NetworkManagerExtraKeysTest: XCTestCase {
    var networkManager: NetworkManagerProtocol?

    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        networkManager = NetworkManger(session: urlSession)
    }

    override func tearDownWithError() throws {
        networkManager = nil
        MockURLProtocol.requestHandler = nil
    }

    func test_Success_WithExtraKeys() {
        let expectation = expectation(description: "Decodes with extra keys")
        let item: [String: Any] = [
            "login": "Test User",
            "avatar_url": "https://example.com/a.png",
            "username": "User",
            "html_url": "https://example.com",
            "extra_key": "ignore_me"
        ]
        let json = try! JSONSerialization.data(withJSONObject: [item], options: [])

        MockURLProtocol.requestHandler = { request in
            let url = request.url ?? URL(string: "https://example.com")!
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, json)
        }

        guard let networkManager = networkManager else { return }
        let url = URL(string: "https://example.com")!
        networkManager.request([Follower].self, endPoint: url) { result in
            switch result {
            case .success(let model):
                XCTAssertGreaterThanOrEqual(model.count, 1)
                XCTAssertEqual(model.first?.login, "Test User")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Unexpected failure: \(error)")
            }
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
