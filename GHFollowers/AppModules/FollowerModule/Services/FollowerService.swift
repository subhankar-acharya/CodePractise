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
        let endPoint = Constants.UserAPIEndpoint.baseURL + "814c4557-fbd8-4d40-a5c2-87381556620e/followers?username=\(userName)"
        let url = URL(string: endPoint)!
        let promise = network.request([Follower].self, endPoint: url)
        return promise
    }
}

