//
//  IFollowerService.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation

protocol IFollowerService {
    func makeNetworkRequest(for userName: String) -> FollowerResponse
}
