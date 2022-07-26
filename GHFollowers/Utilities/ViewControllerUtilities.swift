//
//  ViewControllerUtilities.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation
import UIKit
/// Utility to initialize the view controller
enum Storyboard: String {
    case main = "Main"
}

protocol ViewControllerUtilities where Self: UIViewController {
    static func initialize(on storyboard: Storyboard) -> Self
}

extension ViewControllerUtilities {

    static func initialize(on storyboard: Storyboard) -> Self {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as? Self else {
            fatalError("Could not find view controller with identifier \(String(describing: Self.self))")
        }
        return controller
    }
}

extension UIViewController: ViewControllerUtilities {}
