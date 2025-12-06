//
//  MyProfileViewModel.swift
//  MVVM-Demo-Repo
//
//  Created by Prince Gawai on 06/12/25.
//

import Foundation
import Alamofire

class MyProfileViewModel: NSObject {
    class var sharedInstane: MyProfileViewModel {
        struct Singleton {
            static let instance = MyProfileViewModel()
        }
        return Singleton.instance
    }
    
//    private var apiManager: APIManager!
    private var apiEndPoints = APIEndPoints()
    
    override init() {
        super.init()
//        apiManager = APIManager()
    }

    func leadGenerated(offset : Int, fetch: Int, completionHandler: @escaping (_ success: LeadGeneratorModel?, _ failure: String?) -> Void) {
        let params: Parameters = [
            "offset": offset,
            "fetch": fetch
        ]
        let token = UserDefaults.standard.string(forKey: "loginToken") ?? ""
        //        let headers: HTTPHeaders = [
        //            "Authorization": "\(token)",
        //            "Content-Type": "multipart/form-data"
        //        ]
        let headers : HTTPHeaders = [.authorization(bearerToken: token)]
        let requestUrl = URL(string: "\(BASE_URL)\(apiEndPoints.login)")!
        
        AF.request(requestUrl,method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers ).responseJSON { [self] response in
            guard let data = response.data else {
                completionHandler(nil, "\(response.error)")
                return
            }
            do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(LeadGeneratorModel.self, from: data)
                completionHandler(responseObject, nil)
            }catch let error {
                print(error)
                completionHandler(nil, nil)
            }
        }
    }
}

//MARK: URL SESSION

//import Foundation
//
//class MyProfileViewModel: NSObject {
//
//    class var sharedInstane: MyProfileViewModel {
//        struct Singleton {
//            static let instance = MyProfileViewModel()
//        }
//        return Singleton.instance
//    }
//
//    private var apiEndPoints = APIEndPoints()
//
//    func leadGenerated(offset: Int, fetch: Int, completionHandler: @escaping (_ success: LeadGeneratorModel?, _ failure: String?) -> Void) {
//
//        let token = UserDefaults.standard.string(forKey: "loginToken") ?? ""
//        let urlString = "\(BASE_URL)\(apiEndPoints.login)"
//
//        guard let url = URL(string: urlString) else {
//            completionHandler(nil, "Invalid URL")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        // Headers
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//
//        // Body
//        let params: [String: Any] = ["offset": offset, "fetch": fetch]
//
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
//        } catch {
//            completionHandler(nil, "Invalid Parameters")
//            return
//        }
//
//        // URLSession Call
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//
//            // Error
//            if let error = error {
//                completionHandler(nil, error.localizedDescription)
//                return
//            }
//
//            guard let data = data else {
//                completionHandler(nil, "No data received")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let responseObject = try decoder.decode(LeadGeneratorModel.self, from: data)
//                completionHandler(responseObject, nil)
//            } catch let decodeError {
//                print("Decoding error:", decodeError)
//                completionHandler(nil, "Unable to decode response")
//            }
//        }
//
//        task.resume()
//    }
//}
//


//MARK: URL SESSION USING ASYNC AWAIT
//import Foundation
//
//class MyProfileViewModel: NSObject {
//    
//    static let shared = MyProfileViewModel()
//    private var apiEndPoints = APIEndPoints()
//    
//    // MARK: - Async Await API
//    func leadGenerated(offset: Int, fetch: Int) async throws -> LeadGeneratorModel {
//        
//        let token = UserDefaults.standard.string(forKey: "loginToken") ?? ""
//        let urlString = "\(BASE_URL)\(apiEndPoints.login)"
//        
//        guard let url = URL(string: urlString) else {
//            throw URLError(.badURL)
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        
//        // Headers
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        
//        // Body
//        let params: [String: Any] = [
//            "offset": offset,
//            "fetch": fetch
//        ]
//        
//        request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
//        
//        // Async Await URLSession
//        let (data, response) = try await URLSession.shared.data(for: request)
//        
//        // Validate HTTP Status
//        if let httpResponse = response as? HTTPURLResponse,
//           !(200...299).contains(httpResponse.statusCode) {
//            throw URLError(.badServerResponse)
//        }
//        
//        // Decode
//        do {
//            return try JSONDecoder().decode(LeadGeneratorModel.self, from: data)
//        } catch {
//            print("Decode error:", error)
//            throw error
//        }
//    }
//}
//

//MARK: ALAMOFIRE USING ASYNC AWAIT

//import Foundation
//import Alamofire
//
//class MyProfileViewModel: NSObject {
//    
//    static let shared = MyProfileViewModel()
//    private let apiEndPoints = APIEndPoints()
//    
//    // MARK: - Async/Await Alamofire Method
//    func leadGenerated(offset: Int, fetch: Int) async throws -> LeadGeneratorModel {
//        
//        let token = UserDefaults.standard.string(forKey: "loginToken") ?? ""
//        
//        let url = "\(BASE_URL)\(apiEndPoints.login)"
//        
//        let params: Parameters = [
//            "offset": offset,
//            "fetch": fetch
//        ]
//        
//        let headers: HTTPHeaders = [
//            "Authorization": "Bearer \(token)",
//            "Content-Type": "application/json"
//        ]
//        
//        // Alamofire Async Await
//        return try await withCheckedThrowingContinuation { continuation in
//            
//            AF.request(url,
//                       method: .post,
//                       parameters: params,
//                       encoding: JSONEncoding.default,
//                       headers: headers)
//                .validate()
//                .responseDecodable(of: LeadGeneratorModel.self) { response in
//                    
//                    switch response.result {
//                    case .success(let model):
//                        continuation.resume(returning: model)
//                        
//                    case .failure(let error):
//                        continuation.resume(throwing: error)
//                    }
//                }
//        }
//    }
//}
//
//
