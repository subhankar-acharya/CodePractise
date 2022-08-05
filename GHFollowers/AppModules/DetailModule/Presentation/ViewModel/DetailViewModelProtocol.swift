//
//  DetailViewModelProtocol.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 04/08/22.
//

import Foundation

protocol DetailViewModelProtocol {
    var follower: Follower { get }
    var outputDelegate: DetailViewModelOutputProtocol? { get set }
    func checkSafariVCLoad()
}
