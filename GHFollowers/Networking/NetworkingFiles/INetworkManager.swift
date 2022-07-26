//
//  INetworkManager.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation
import PromiseKit

typealias Response<T> = Promise<T>
typealias FollowerResponse = Promise<[Follower]>

protocol INetworkManager {
    func request<T: Codable>(_ type: T.Type, endPoint: URL) -> Response<T>
}
