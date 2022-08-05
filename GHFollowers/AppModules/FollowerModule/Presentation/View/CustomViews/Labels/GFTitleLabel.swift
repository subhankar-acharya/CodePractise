//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import UIKit

class GFTitleLabel: UILabel {

    private enum Constants {
        static let minScaleFactor: CGFloat = 0.9
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }

    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = Constants.minScaleFactor
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}

