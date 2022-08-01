//
//  SearchUseCaseProtocol.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import Foundation

protocol SearchUseCaseProtocol {
    func validateUser(for userName: String, completion: (Bool) -> ())
}
