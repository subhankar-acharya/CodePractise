//
//  ISearchUseCase.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import Foundation

protocol ISearchUseCase {
    func validateUser(for userName: String, completion:(Bool) -> ())
}
