//
//  NetworkManager.swift
//  Lyrics
//
//  Created by Farid Rustamov on 13.04.25.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func request<T: Codable>(path: String,
                             model: T.Type,
                             method: HTTPMethod = .get,
                             encodingType: EncodingType = .url,
                             parameters: Parameters? = nil) async throws -> T? {
        return await withCheckedContinuation { continuation in
            AF.request(path,
                       method: method,
                       parameters: parameters,
                       encoding: encodingType == .url ? URLEncoding.default : JSONEncoding.default).responseDecodable(of: model.self) { response in
                switch response.result {
                case .success(let data):
                    continuation.resume(returning: data)
                default: break
                }
            }
        }
    }
}
