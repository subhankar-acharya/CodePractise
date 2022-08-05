//
//  MockDetailUseCase.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 05/08/22.
//

import Foundation
@testable import GHFollowers

class MockDetailUseCase: DetailUseCaseProtocol {

    func validateURL(for htmlString: String, completion: (Bool) -> ()) {
        if htmlString.isEmpty {
            completion(false)
        } else {
            completion(true)
        }
    }
}
