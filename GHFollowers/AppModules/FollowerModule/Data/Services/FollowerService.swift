//
//  FollowerService.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation
import PromiseKit
/// Makes network call after preparing url
class FollowerService: FollowerServiceProtocol {

    private let network: NetworkManagerProtocol

    init(network: NetworkManagerProtocol) {
        self.network = network
    }
    
    func makeNetworkRequest() -> FollowerResponse {
        let endPoint = AppConstants.UserAPIEndpoint.baseURL
        let url = URL(string: endPoint)
        guard let url = url else { return Promise.value([]) }
        let followerResponse = network.request([Follower].self, endPoint: url)
        return followerResponse
    }
}

