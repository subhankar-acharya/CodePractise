//
//  MockUseCase.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import Foundation
@testable import GHFollowers

class MockSearchUseCase: SearchUseCaseProtocol {
    
    func validateUser(for userName: String, completion: (Bool) -> ()) {
        if userName.isEmpty {
            completion(false)
        } else {
            completion(true)
        }
    }
}
