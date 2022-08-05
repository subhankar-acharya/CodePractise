//
//  DetailViewModelOutputProtocol.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 04/08/22.
//

import Foundation

protocol DetailViewModelOutputProtocol: AnyObject {
    func success()
    func errorMessage(_ error: String)
}
