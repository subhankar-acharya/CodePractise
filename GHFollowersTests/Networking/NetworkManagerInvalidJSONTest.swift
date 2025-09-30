//
//  NetworkManagerInvalidJSONTest.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 9/30/25.
//

import XCTest
@testable import GHFollowers

final class NetworkManagerInvalidJSONTest: XCTestCase {
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

    func test_InvalidJSON_FailsDecoding() {
        let expectation = expectation(description: "Invalid JSON triggers failure")
        let invalidJSON = Data("{".utf8)

        MockURLProtocol.requestHandler = { request in
            let url = request.url ?? URL(string: "https://example.com")!
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, invalidJSON)
        }

        guard let networkManager = networkManager else { return }
        let url = URL(string: "https://example.com")!
        networkManager.request([Follower].self, endPoint: url) { result in
            switch result {
            case .success:
                XCTFail("Expected decoding failure for invalid JSON")
            case .failure:
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
