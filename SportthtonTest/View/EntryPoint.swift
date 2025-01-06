//
//  EntryPoint.swift
//  SportthtonTest
//
//  Created by Yolima Pereira Ruiz on 30/12/24.
//

import SwiftUI

struct EntryPoint: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ZStack {
                CurvedBackground()
                VStack {
                    Text("Hello, Sports Lover")
                    
                    NavigationLink(destination: AddProfileView() ){
                        
                        Standarbutton(label: "Continue")
                        
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    EntryPoint()
}
