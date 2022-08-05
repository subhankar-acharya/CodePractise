//
//  FollowerDetailViewController+Ext.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 04/08/22.
//

import UIKit
import SafariServices

extension FollowerDetailViewController: Alertable {
     func loadSafariVC() {
        viewModel?.checkSafariVCLoad()
    }
}

extension FollowerDetailViewController: DetailViewModelOutputProtocol {

    func success() {
        if let follower = viewModel?.follower {
            if let url = URL(string: follower.htmlUrl) {
                let safariVC = SFSafariViewController(url: url)
                safariVC.preferredControlTintColor = .systemBlue
                DispatchQueue.main.async {
                    self.present(safariVC, animated: true)
                }
            }
        }
    }

    func errorMessage(_ error: String) {
        showAlert(message: error, on: self)
    }
}
