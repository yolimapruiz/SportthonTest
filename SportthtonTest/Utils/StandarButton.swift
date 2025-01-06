//
//  StandarButton.swift
//  SportthtonTest
//
//  Created by Yolima Pereira Ruiz on 30/12/24.
//

import SwiftUI

struct Standarbutton: View {
    var label: String
    
    var body: some View {
     
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black.opacity(0.4), lineWidth: 1)
                .frame(width: 341, height: 48)
                .overlay{
                    Text(label)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.black)
                    //.frame(width: 327, height: 50)
                    // .background(Color.white)
                        .cornerRadius(25)
                }
        
    }
}
