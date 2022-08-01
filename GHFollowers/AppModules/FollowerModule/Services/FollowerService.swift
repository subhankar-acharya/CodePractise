//
//  FollowerService.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation
/// Makes network call after preparing url
class FollowerService: FollowerServiceProtocol {

    private let network: NetworkManagerProtocol

    init(network: NetworkManagerProtocol) {
        self.network = network
    }
    
    func makeNetworkRequest(for userName: String) -> FollowerResponse {
        let endPoint = Constants.UserAPIEndpoint.baseURL + "\(userName)/followers?per_page=20&page=1"
        let url = URL(string: endPoint)!
        let promise = network.request([Follower].self, endPoint: url)
        return promise
    }
}

