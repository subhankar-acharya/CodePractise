//
//  IFollowerViewImpl.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation

protocol IFollowerViewModel {
    var followers: [Follower] { get }
    var ghUserName: String {get set}
    func fetchFollowers() 
    var outputDelegate: FollowerViewModelOutput? { get set }
}
