//
//  SelectYourInterestsView.swift
//  SportthtonTest
//
//  Created by Yolima Pereira Ruiz on 30/12/24.
//

import SwiftUI

struct SelectYourInterestsView: View {
    @Environment(\.presentationMode) var presentationMode
   
        var body: some View {
            ZStack{
                CurvedBackground()
                VStack{
                    VStack(alignment: .leading) {
                        
                        Text("Select Your \n Interests")
                            .font(.system(size: 37, weight: .medium))
                        
                        Text("Pick your sports to get more recommendation \n and informtion")
                            .font(.system(size: 15, weight: .regular))
                            .padding(.top, 24)
                        
                    }
                    .padding(.top, 12)
                    .padding(.leading, 24)
                    
                    
                    //category selection 
                    CategoriesView()
                        .padding(.top, 70)
                    //continue button
                    Spacer()
                    Standarbutton(label: "Continue")
                    
                }
                
            }
            .padding(.bottom, 79)
           .navigationBarBackButtonHidden(true)
           .toolbar {
               ToolbarItem(placement: .navigationBarLeading) {
                   BackButton(action: {
                       presentationMode.wrappedValue.dismiss()

                       print("Going back")
                   })
               }
                
            }
            
        }
            
    
}

#Preview {
    SelectYourInterestsView()
}
