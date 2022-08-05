//
//  DetailUseCase.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 05/08/22.
//

import Foundation

/// Business logic to validate if htmlurl is empty and pass back to view model.
class DetailUseCase: DetailUseCaseProtocol {
    
    func validateURL(for htmlString: String, completion: (Bool) -> ()) {
        if htmlString.isEmpty {
            completion(false)
        } else {
            completion(true)
        }
    }
}
