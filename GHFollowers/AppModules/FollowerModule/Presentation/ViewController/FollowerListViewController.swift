//
//  FollowerListViewController.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import UIKit
/// Populates data passed back to it by follower view model
final class FollowerListViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    private enum Constants {
        static let screenTitle = "Followers"
    }

    // MARK: - Property
    var viewModel: FollowerViewModelProtocol?

    // MARK: - Viewcontroller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title =  Constants.screenTitle
        view.accessibilityIdentifier = Constants.screenTitle
        fetchFollowers()
        configure()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    // MARK: - Method
    func configure() {
        tableView.register(FollowerCell.self, forCellReuseIdentifier: FollowerCell.Constants.reuseID)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}


