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
    
    func makeNetworkRequest(completion: @escaping (Result<[Follower], Error>) -> Void) {
        let endPoint = AppConstants.UserAPIEndpoint.baseURL
        let url = URL(string: endPoint)
        guard let url = url else {
            completion(.success([]))
            return
        }
        network.request([Follower].self, endPoint: url, completion: completion)
    }
}

