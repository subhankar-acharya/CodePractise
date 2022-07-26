//
//  GFError.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import Foundation

enum GFError : String, Error {
    case inavalidUsername  = "This username created a invalid request. Plese try again."
    case unableToComplete  = "Unable to complete your request. PLease check your internet connection."
    case inavlidResponse   = "Invalid response from the server.Please try again."
    case invalidData       = "The data recieved from the server was invalid. Please try again."
}
