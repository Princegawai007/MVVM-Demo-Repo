//
//  Utilities.swift
//  MVVM-Demo-Repo
//
//  Created by Prince Gawai on 06/12/25.
//

import Foundation
import UIKit
import CoreLocation

// MARK: - Base URL FOR DEV
let BASE_URL = "https://yoururl.com"//// This URL for testing & development



// MARK: - API end points
struct APIEndPoints {
    let login = "login"
}

// MARK: - Constant Strings
struct StringsConstant {
    let LOGIN_ERROR_MESSAGE = "Invalid Email or Password"
    let ERROR_MESSAGE = "Sorry something went wrong please try again"
    
}
// MARK: - Notification name
struct NotificationName {
    var uploadFloorPlan = NSNotification.Name(rawValue: "uploadFloorPlan")
}
struct Alert {
    func alertControllerWith(title: String, message: String, actions: [UIAlertAction]? = [], preferredStyle: UIAlertController.Style? = .alert) -> UIAlertController {
        let alertCtrl = UIAlertController(title: title, message: message, preferredStyle: preferredStyle!)
        actions?.forEach { action in
            alertCtrl.addAction(action)
        }
        if actions?.count == 0 {
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertCtrl.addAction(okAction)
        }
        return alertCtrl
    }
}
