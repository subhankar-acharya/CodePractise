//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import UIKit

class GFAvatarImageView: UIImageView {

    private enum Constants {
        static let placeholderImage = UIImage(named: "avatar-placeholder")
        static let cornerValue: CGFloat = 10
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        layer.cornerRadius = Constants.cornerValue
        clipsToBounds = true
        image = Constants.placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
