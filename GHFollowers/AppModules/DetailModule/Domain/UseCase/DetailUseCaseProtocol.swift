//
//  DetailUseCaseProtocol.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 05/08/22.
//

import Foundation

protocol DetailUseCaseProtocol {
    func validateURL(for htmlString: String, completion: (Bool) -> ())
}
