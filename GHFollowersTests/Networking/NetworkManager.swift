//
//  NetworkManager.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import XCTest
@testable import GHFollowers

class NetworkManagerTest: XCTestCase {

    var networkManager: INetworkManager!
    let testUrl = URL(string: "TestURL")!

    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        networkManager = NetworkManger(session: urlSession)
    }

    func test_NetworkClassForSuccess() {

        let expecatation = expectation(description: "Success")
        let data = loadJsonData(file: "Follower")

        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                throw NSError(domain: "URL", code: NSURLErrorBadURL, userInfo: nil)
            }

            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }

        networkManager.request([Follower].self, endPoint: testUrl)
            .done { model in
                let followerCount = model.count
                if followerCount >= 1 {
                    XCTAssertTrue(model.first?.login == "ABC")
                    expecatation.fulfill()
                }
            }.catch { error in
                XCTFail("Error was not expected: \(error)")
            }

        wait(for: [expecatation], timeout: 1.0)
    }

    func test_NetworkClassForURLFailure() {

        let expectation = expectation(description: "Should get URL Failure")

        networkManager.request([Follower].self, endPoint: testUrl)
            .catch { error in
                XCTAssertTrue((error as NSError).domain == "URL")
                expectation.fulfill()
            }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_ParsingFailure() {
        let expectation = expectation(description: "Parsing Failure")
        // Prepare response
        let data = Data()
        MockURLProtocol.requestHandler = { request in
          let response = HTTPURLResponse(url: request.url!, statusCode: 400, httpVersion: nil, headerFields: nil)!
          return (response, data)
        }

        networkManager.request(Follower.self, endPoint: testUrl)
            .done { model in
                XCTFail("Success response was not expected.")
            }.catch { error in
                expectation.fulfill()
            }


        wait(for: [expectation], timeout: 1.0)
      }

    private func loadJsonData(file: String) -> Data? {

        if let jsonFilePath = Bundle(for: type(of: self)).path(forResource: file, ofType: "json") {
            let jsonFileURL = URL(fileURLWithPath: jsonFilePath)

            if let jsonData = try? Data(contentsOf: jsonFileURL) {
                return jsonData
            }
        }
        return nil
    }
}
