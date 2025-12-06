//
//  LeadGeneratorModel.swift
//  MVVM-Demo-Repo
//
//  Created by Prince Gawai on 06/12/25.
//

import Foundation

struct LeadGeneratorModel: Codable {
    let success: Bool?
    let message: String?
    let offset: Int?
    let count: Int?
    let leads: [Lead]
}

struct Lead: Codable {
    let id: Int?
    let createddate: String?
    let schemes__c: String?
    let name: String?
    let salutation: String?
    let scheme_type__c: String?
}
