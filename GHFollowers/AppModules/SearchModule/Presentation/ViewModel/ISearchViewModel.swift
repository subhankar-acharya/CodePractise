//
//  ISerachViewModel.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import Foundation

protocol ISearchViewModel {
    func pushFollowerListVC()
    var outputDelegate: SearchViewModelOutput? { get set }
    var inputDelegate: SearchViewModelInput? {get set }
}
