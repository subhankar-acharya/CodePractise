//
//  RouterProtocol.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 07/08/22.
//

import UIKit

protocol RouterProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
}
