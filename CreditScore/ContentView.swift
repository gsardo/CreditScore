//
//  ContentView.swift
//  CreditScore
//
//  Created by Giuseppe Sardo on 3/7/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .foregroundColor(.gray)
                .frame(width: 120, height: 120)
            
            Text(String(viewModel.creditReport?.creditReportInfo.creditScore ?? 1000))
                .bold()
                .font(.title3)
            
            Text(viewModel.creditReport?.creditReportInfo.scoreDescription ?? "Placeholder descriptions")
                .padding()
            
            Text(String(viewModel.creditReport?.creditReportInfo.nextReport ?? 31))
                .padding()
            
            Text(viewModel.creditReport?.creditReportInfo.referenceNumber ?? "Placeholder reference")
                .padding()
        }
        .padding()
        .task {
            //This is called on appear of the view
            viewModel.getCreditScoreInfo()
        }
    }
}
