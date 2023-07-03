//
//  Repository.swift
//  CreditScore
//
//  Created by Giuseppe Sardo on 3/7/2023.
//

import Foundation

struct Repository {
    
    
    // network requests
    
    func fetchCreditScore() async throws -> CreditReport {
        let endpoint = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
        
        guard let url = URL(string: endpoint) else { throw CreditScoreError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CreditScoreError.invalidResponse
        }
        
        // this decoding can be split for when you use different enpoints
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(CreditReport.self, from: data)
        } catch {
            throw CreditScoreError.invalidData
        }
    }
}
