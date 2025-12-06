//
//  NetworkManager.swift
//  MVVM-Demo-Repo
//
//  Created by Prince Gawai on 06/12/25.
//

//MARK: MODERN UPDATED 2025 LATEST CODE

//import Foundation
//import Alamofire
//
//class NetworkManager {
//    static let shared = NetworkManager()
//    
//    func post<T: Decodable>(_ url: String, params: Parameters, headers: HTTPHeaders) async throws -> T {
//        
//        return try await withCheckedThrowingContinuation { continuation in
//            
//            AF.request(url,
//                       method: .post,
//                       parameters: params,
//                       encoding: JSONEncoding.default,
//                       headers: headers)
//                .validate()
//                .responseDecodable(of: T.self) { response in
//                    
//                    switch response.result {
//                    case .success(let model):
//                        continuation.resume(returning: model)
//                    case .failure(let error):
//                        continuation.resume(throwing: error)
//                    }
//                }
//        }
//    }
//}
