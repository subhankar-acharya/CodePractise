//
//  FollowerListViewController+Ext.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import UIKit

extension FollowerListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.followers.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FollowerCell.reuseID) as? FollowerCell else {
            fatalError("Cell not found")
        }
        if let followers = viewModel?.followers[indexPath.row] {
            cell.set(follower: followers)
        }
        return cell
    }
}

extension FollowerListViewController: Alertable {

    func fetchFollowers() {
        viewModel?.fetchFollowers()
    }
}

extension FollowerListViewController: FollowerViewModelOutput {

    func success() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func errorMessage(_ error: String) {
        showAlert(message: error, on: self)
    }
}
