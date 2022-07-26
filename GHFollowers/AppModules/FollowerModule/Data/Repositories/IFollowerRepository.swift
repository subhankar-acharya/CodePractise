//
//  IFollowerRepository.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation

protocol IFollowerRepository {
    func makeServiceCallToGetFollowers(for userName: String) -> FollowerResponse
}
