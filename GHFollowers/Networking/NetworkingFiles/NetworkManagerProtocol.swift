//
//  NetworkManagerProtocol.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation

protocol NetworkManagerProtocol {
    func request<T: Decodable>(
            _ type: T.Type,
            endPoint: URL,
            completion: @escaping (Result<T, Error>) -> Void
        )
}
