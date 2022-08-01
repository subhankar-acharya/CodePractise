//
//  FollowerServiceProtocol.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation

protocol FollowerServiceProtocol {
    func makeNetworkRequest(for userName: String) -> FollowerResponse
}
