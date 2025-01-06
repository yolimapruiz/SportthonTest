//
//  ViewModel.swift
//  SportthtonTest
//
//  Created by Yolima Pereira Ruiz on 5/01/25.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var categories: [(name: String, options: [String])] = []
    
    init() {
        getCategories()
    }
    
    func getCategories() {
        categories = Categories.allCases.map { $0.details }
        
    }
    
}
