//
//  FollowerDetailViewController.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 04/08/22.
//

import UIKit

class FollowerDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var profileButton: UIButton!

    // MARK: - Properties
    var viewModel: DetailViewModelProtocol?
    private enum Constants {
        static let screenTitle = "Follower"
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.screenTitle
        view.accessibilityIdentifier = Constants.screenTitle
        showFollowerDetail()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    // MARK: - Methods
    func showFollowerDetail() {
        if let follower = viewModel?.follower {
            detailNameLabel.text = follower.username
            detailImageView.downloadImage(from: follower.avatarUrl)
        }
    }

    // MARK: - Actions
    @IBAction func didTapProfile(_ sender: Any) {
        loadSafariVC()
    }
}
