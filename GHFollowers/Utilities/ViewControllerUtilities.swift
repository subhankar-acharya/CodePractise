//
//  ViewControllerUtilities.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import UIKit

protocol StoryboardInstantiation {
    // MARK: - Properties
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var storyboardIdentifier: String { get }

    // MARK: - Methods
    /// return the type conforming to the StoryboardInstantiation protocol
    static func instantiate() -> Self
}

/// provide default implementations for the computed properties and the instantiate() method
extension StoryboardInstantiation where Self: UIViewController {

    // MARK: - Properties
    static var storyboardName: String {
        return "Main"
    }
    static var storyboardBundle: Bundle {
        return .main
    }
    /// returns the name of the class
    static var storyboardIdentifier: String {
        return String(describing: self)
    }

    // MARK: - Methods
    static func instantiate() -> Self {
        guard let viewController = UIStoryboard(name: storyboardName, bundle: storyboardBundle).instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to Instantiate View Controller With Storyboard Identifier \(storyboardIdentifier)")
        }
        return viewController
    }
}
/// global conformance
extension UIViewController: StoryboardInstantiation {}
