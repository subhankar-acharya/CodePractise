//
//  FollowerRepositoryProtocol.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation

protocol FollowerRepositoryProtocol {
    func makeServiceCallToGetFollowers(completion: @escaping (Result<[Follower], Error>) -> Void)
}
