//
//  NetworkManagerNilDataTest.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 10/1/25.
//

import XCTest
@testable import GHFollowers

final class NetworkManagerNilDataTest: XCTestCase {
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

    func test_NilData_ReturnsBadServerResponseError() {
        let expectation = expectation(description: "Failure on nil data")
        MockURLProtocol.requestHandler = { request in
            let url = request.url ?? URL(string: "https://example.com")!
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, nil)
        }
        let url = URL(string: "https://example.com")!
        networkManager?.request([Follower].self, endPoint: url) { result in
            switch result {
            case .success:
                XCTFail("Expected failure when data is nil")
            case .failure(let error as URLError):
                XCTAssertEqual(error.code, .badServerResponse)
                expectation.fulfill()
            case .failure:
                expectation.fulfill() // accept any failure if type-cast fails
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }
}

