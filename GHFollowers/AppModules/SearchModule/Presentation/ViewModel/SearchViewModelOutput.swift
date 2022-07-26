//
//  SearchViewModelOutput.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import Foundation

protocol SearchViewModelOutput {
    func success()
    func errorMessage(_ error: String)
}
