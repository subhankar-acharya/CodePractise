//
//  FollowerUseCaseProtocol.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation

protocol FollowerUseCaseProtocol {
    func getFollowers(completion: @escaping (Result<[Follower], Error>) -> Void)
}
