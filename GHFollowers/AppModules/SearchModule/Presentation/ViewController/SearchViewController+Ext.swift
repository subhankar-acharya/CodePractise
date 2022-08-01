//
//  SearchViewController+Ext.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import UIKit

extension SearchViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fetchFollowers()
        return true
    }
}

extension SearchViewController: Alertable {
     func fetchFollowers() {
        viewModel?.pushFollowerListVC()
    }
}

extension SearchViewController: SearchViewModelInput {
    func getUserName() -> String {
        return userNameTextField.text ?? ""
    }
}

extension SearchViewController: SearchViewModelOutput {

    func success() {
        let module = FollowerModule(ghUserName: userNameTextField.text ?? "")
        let followerListViewController = module.createFollowerListViewController()
        followerListViewController.view.accessibilityIdentifier = Constants.AccessiblityIdentifier.identifier
        self.navigationController?.pushViewController(followerListViewController, animated: true)
    }

    func errorMessage(_ error: String) {
        showAlert(message: error, on: self)
    }
}

