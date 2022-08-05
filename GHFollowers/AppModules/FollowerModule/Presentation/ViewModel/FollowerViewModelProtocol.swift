//
//  FollowerViewModelProtocol.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation

protocol FollowerViewModelProtocol {
    var followers: [Follower] { get }
    func fetchFollowers() 
    var outputDelegate: FollowerViewModelOutput? { get set }
}
