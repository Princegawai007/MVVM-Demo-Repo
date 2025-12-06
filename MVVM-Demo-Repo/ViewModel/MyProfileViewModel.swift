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
