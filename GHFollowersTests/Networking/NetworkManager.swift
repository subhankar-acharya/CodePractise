//
//  NetworkManager.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import XCTest
@testable import GHFollowers

class NetworkManagerTest: XCTestCase {

    var networkManager: NetworkManagerProtocol?
    let testUrl = URL(string: "TestURL")

    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        networkManager = NetworkManger(session: urlSession)
    }
    
    override func tearDownWithError() throws {
        networkManager = nil
    }

    func test_NetworkClass_ForSuccess() {

        let expecatation = expectation(description: "Success case for Network")

        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                throw NSError(domain: "URL", code: NSURLErrorBadURL, userInfo: nil)
            }

            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)

            guard let response = response else { return (HTTPURLResponse(),Data()) }
            return (response, MockFollowersData.mockDictionary())
        }
        guard let testUrl = testUrl,
              let networkManager = networkManager else { return }
        networkManager.request([Follower].self, endPoint: testUrl) { result in
            switch result {
            case .success(let model):
                let followerCount = model.count
                if followerCount >= 1 {
                    XCTAssertTrue(model.first?.login == "Test User")
                    expecatation.fulfill()
                }
            case .failure(let error):
                XCTFail("Error was not expected in this case: \(error)")
            }
        }

        wait(for: [expecatation], timeout: 1.0)
    }

    func test_Parsing_Failure() {
        let expectation = expectation(description: "Parsing Failure occured")
        // Prepare response
        let data = Data()
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                throw NSError(domain: "URL", code: NSURLErrorBadURL, userInfo: nil)
            }
            let response = HTTPURLResponse(url: url, statusCode: 400, httpVersion: nil, headerFields: nil)
            guard let response = response else { return (HTTPURLResponse(),Data()) }
            return (response, data)
        }

        guard let testUrl = testUrl,
              let networkManager = networkManager else { return }
        networkManager.request(Follower.self, endPoint: testUrl) { result in
            switch result {
            case .success:
                XCTFail("Success response was not expected in this case.")
            case .failure:
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
