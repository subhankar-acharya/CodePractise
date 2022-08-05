//
//  UserTableViewCell.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 24/07/22.
//

import UIKit

class FollowerCell: UITableViewCell {

    enum Constants {
        static let reuseID = "FollowerCell"
        static let padding: CGFloat = 14
        static let fontSize: CGFloat = 16
        static let imageViewPadding: CGFloat = 60
        static let nameLabelPadding: CGFloat = 30
        static let nameLabelHeight: CGFloat = 40
    }

    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: Constants.fontSize)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(follower: Follower) {
        usernameLabel.text = follower.login.uppercased()
        avatarImageView.downloadImage(from: follower.avatarUrl)
    }

    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        accessoryType = .disclosureIndicator
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.imageViewPadding),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.imageViewPadding),

            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.nameLabelPadding),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: Constants.nameLabelHeight)
        ])
    }
}
