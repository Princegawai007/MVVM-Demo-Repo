//
//  ViewController.swift
//  MVVM-Demo-Repo
//
//  Created by Prince Gawai on 06/12/25.
//


import UIKit
import CoreLocation
import MapKit
//import Reachability

class MyProfileViewController: UIViewController, CLLocationManagerDelegate {
        @IBOutlet weak var leadGenratorCountLabel: UILabel!
   
    var leadGeneratedModel = [LeadGeneratorModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.leadGenerated()
    }
    
    func leadGenerated(){
        MyProfileViewModel.sharedInstane.leadGenerated(offset:0, fetch: 20) { success, failure in
            guard let success = success else {
                let alertCtrl = Alert().alertControllerWith(title: "Alert", message: success?.message ?? "Sorry something went wrong")
//                self.view.hideActivityIndicator()
                self.present(alertCtrl, animated: true)
                return

//                self.view.hideActivityIndicator()
                return
            }
            if (success.success != nil) == true {
                self.leadGeneratedModel = [success]
                if success.leads.count == 0 {
                    self.leadGenratorCountLabel.text = "\(0)"
                }
                self.leadGenratorCountLabel.text = "\(success.count ?? 0)"
            }
        }
    }
    
}

//MARK: URL SESSION
//
//func leadGenerated() {
//    MyProfileViewModel.sharedInstane.leadGenerated(offset: 0, fetch: 20) { success, failure in
//        
//        DispatchQueue.main.async {
//            if let failure = failure {
//                let alertCtrl = Alert().alertControllerWith(title: "Alert", message: failure)
//                self.present(alertCtrl, animated: true)
//                return
//            }
//            
//            guard let success = success else {
//                let alertCtrl = Alert().alertControllerWith(title: "Alert", message: "Something went wrong")
//                self.present(alertCtrl, animated: true)
//                return
//            }
//            
//            if success.success != nil {
//                self.leadGeneratedModel = [success]
//                if success.leads.count == 0 {
//                    self.leadGenratorCountLabel.text = "0"
//                } else {
//                    self.leadGenratorCountLabel.text = "\(success.count ?? 0)"
//                }
//            }
//        }
//    }
//}
