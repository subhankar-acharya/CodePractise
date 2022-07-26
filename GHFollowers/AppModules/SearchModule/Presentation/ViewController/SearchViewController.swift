//
//  ViewController.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 24/07/22.
//

import UIKit
/// Passes username string to FollowerListViewController and shows validation message in case of error.
class SearchViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var getFollowersButton: UIButton!

    var viewModel: ISearchViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        getFollowersButton.layer.cornerRadius = 25
        createDismissKeyboardTapGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func didTapGetFollowers(_ sender: Any) {
        fetchFollowers()
    }

    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

