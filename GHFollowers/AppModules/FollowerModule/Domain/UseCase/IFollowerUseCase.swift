//
//  IFollowerUseCase.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation

protocol IFollowerUseCase {
    func getFollowers(for userName: String) -> FollowerResponse
}
