//
//  FollowerDetailViewController.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 04/08/22.
//

import UIKit

class FollowerDetailViewController: UIViewController {

    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    var viewModel: DetailViewModelProtocol?
    private enum Constants {
        static let screenTitle = "Follower"
    }

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

    func showFollowerDetail() {
        if let follower = viewModel?.follower {
            detailNameLabel.text = follower.username
            detailImageView.downloadImage(from: follower.avatarUrl)
        }
    }
    @IBAction func didTapProfile(_ sender: Any) {
        loadSafariVC()
    }
}
