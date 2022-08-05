//
//  DetailViewModel.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 04/08/22.
//

import Foundation

final class DetailViewModel: DetailViewModelProtocol {

    // MARK: - Properties
    weak var outputDelegate: DetailViewModelOutputProtocol?
    var follower: Follower
    private let useCase: DetailUseCaseProtocol

    // MARK: - Initialise
    init(follower: Follower, useCase: DetailUseCaseProtocol) {
        self.follower = follower
        self.useCase = useCase
    }

    // MARK: - Method
    func checkSafariVCLoad() {
        let htmlURL = follower.htmlUrl
        self.useCase.validateURL(for: htmlURL) { result in
            if result {
                self.outputDelegate?.success()
            } else {
                self.outputDelegate?.errorMessage("Bad URL")
            }
        }
    }
}
