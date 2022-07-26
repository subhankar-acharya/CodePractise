//
//  FollowerRepositoryImpl.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation
/// Passes data to service layer and returns back response 
class FollowerRepositoryImpl: IFollowerRepository {

    private let service: IFollowerService

    init(service: IFollowerService) {
        self.service = service
    }

    func makeServiceCallToGetFollowers(for userName: String) -> FollowerResponse {
        return service.makeNetworkRequest(for: userName)
    }
}
