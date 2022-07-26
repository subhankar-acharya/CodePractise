//
//  FollowerListViewController.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation
import UIKit
/// Populates data passed back to it by follower view model
class FollowerListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: IFollowerViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Followers"
        fetchFollowers()
        configure()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func configure() {
        tableView.register(FollowerCell.self, forCellReuseIdentifier: FollowerCell.reuseID)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

