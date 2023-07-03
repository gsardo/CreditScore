//
//  Model.swift
//  CreditScore
//
//  Created by Giuseppe Sardo on 3/7/2023.
//

import Foundation

// model the data from structure of JSON response to fields that we want to use in the App
// See ServiceResponse in ClearScore app

struct CreditReport: Codable {
    let creditReportInfo: CreditReportInfo
}

struct CreditReportInfo: Codable {
    let creditScore: Int
    let referenceNumber: String
    let scoreDescription: String
    let nextReport: Int
    
    enum CodingKeys: String, CodingKey {
        case creditScore = "score"
        case referenceNumber = "clientRef"
        case scoreDescription = "equifaxScoreBandDescription"
        case nextReport = "daysUntilNextReport"
    }
}
