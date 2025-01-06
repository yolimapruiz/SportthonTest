//
//  TellUsAboutYou.swift
//  SportthtonTest
//
//  Created by Yolima Pereira Ruiz on 30/12/24.
//

import SwiftUI

struct TellUsAboutYou: View {
    @State private var dob: Date = Date()
    @State private var gender: String = "Male"
    @State private var phone: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            CurvedBackground()
            VStack{
                VStack(alignment: .leading) {
                    
                    Text("Tell us About \n you")
                        .font(.system(size: 37, weight: .medium))
                    //.multilineTextAlignment(.leading)
                    
                    
                    Text("To serve you better, we need few information \n from you")
                        .font(.system(size: 15, weight: .regular))
                        .padding(.top, 24)
                    
                }
                .padding(.top, 12)
                .padding(.leading, 24)
                
                
                //User Form
                
                UserFormView(dob: $dob, gender: $gender, phone: $phone)
                    .padding(.top, 92)
                
                Spacer()
                
                //continue button
                NavigationLink(destination: SelectYourInterestsView() ){
                    
                    Standarbutton(label: "Continue")

                }
                    
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
    TellUsAboutYou()
}
