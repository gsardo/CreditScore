//
//  ViewModel.swift
//  CreditScore
//
//  Created by Giuseppe Sardo on 3/7/2023.
//

import Foundation

class ViewModel: ObservableObject {
    // functions or variables that I want to use to present data to the View
    
    @Published var creditReport: CreditReport?
    
    let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func getCreditScoreInfo() {
        
        Task {
            @MainActor in
            do {
                // then it calls the API to get credit score data for the ContentView
                creditReport = try await repository.fetchCreditScore()
            } catch CreditScoreError.invalidURL {
                print("Invalid URL")
            } catch CreditScoreError.invalidResponse {
                print("Invalid Response")
            } catch CreditScoreError.invalidData {
                print("Invalid Data")
            } catch {
                print("Unexpected error")
            }
        }
        }
    }
