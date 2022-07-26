//
//  BaseTableViewCell.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 24/07/22.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
    
    //    static var nib: UINib {
    //        return UINib(nibName: String(describing: self), bundle: nil)
    //    }

