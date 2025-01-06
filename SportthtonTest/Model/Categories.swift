//
//  Categories.swift
//  SportthtonTest
//
//  Created by Yolima Pereira Ruiz on 4/01/25.
//

import Foundation

enum Categories: CaseIterable {
    case Outdoor
    case Category2
    case Category3
    case Category4
    
    var details: (name: String, options: [String]) {
        switch self {
            
        case .Outdoor:
            
            return ("Outdoor", ["Football", "Basketball", "Cricket", "Tennis", "Soccer", "Rugby", "Lorem", "Swimming", "Voleyball", "Softball", "Hockey", "Ping Pong", "Paddle", "Karate"])
            
        case .Category2:
            
            return ("Category 2", [""])
            
        case .Category3:
           
            return ("Category 3", [""])
            
        case .Category4:
            
            return ("Category 4", [""])
            
        }
        
    }
   
}
