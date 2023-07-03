//
//  CreditScoreApp.swift
//  CreditScore
//
//  Created by Giuseppe Sardo on 3/7/2023.
//

import SwiftUI

//first thing to load when the app is launched
@main
struct CreditScoreApp: App {
    let viewModel = ViewModel(repository: Repository())
    
    var body: some Scene {
        WindowGroup {
            //calls ContentView, which initialises ViewModel with Repository
            ContentView(viewModel: viewModel)
        }
    }
}
