//
//  FollowerViewModelOutput.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation

protocol FollowerViewModelOutput: AnyObject {
    func success()
    func errorMessage(_ error: String)
}
