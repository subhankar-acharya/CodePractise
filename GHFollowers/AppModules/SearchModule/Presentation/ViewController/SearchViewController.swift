//
//  SearchViewController.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 24/07/22.
//

import UIKit
/// Passes username string to FollowerListViewController and shows validation message in case of error.
class SearchViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var getFollowersButton: UIButton!

    // MARK: - Properties
    var viewModel: SearchViewModelProtocol?

    // MARK: - ViewController lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.Title.searchViewController
        getFollowersButton.layer.cornerRadius = 25
        createDismissKeyboardTapGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: - Actions
    @IBAction func didTapGetFollowers(_ sender: Any) {
        fetchFollowers()
    }

    // MARK: - Methods
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}
