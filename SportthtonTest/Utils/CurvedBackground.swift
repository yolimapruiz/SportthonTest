//
//  CurvedBackground.swift
//  SportthtonTest
//
//  Created by Yolima Pereira Ruiz on 29/12/24.
//

import SwiftUI

struct CurvedBackground: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    let width = geometry.size.width
                    let height = 333.52
                    
                    path.move(to: CGPoint(x: 0, y: height * 0.95))
                    
                    
                    
                    path.addQuadCurve(to: CGPoint(x: width / 2, y: height * 0.9 ),
                                      control: CGPoint(x: width / 4, y: height * 0.8))
                    
                    path.addQuadCurve(to: CGPoint(x: width, y: height * 0.95),
                                      control: CGPoint(x: width * (3 / 4), y: height))
                    
                    path.addLine(to: CGPoint(x: width, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: 0))
                    path.closeSubpath()
                }
                .fill(Color.backGroundPink)
            }
            .ignoresSafeArea()
           
        }
        
    }
}


#Preview {
    CurvedBackground()
}
