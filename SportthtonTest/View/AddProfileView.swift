//
//  ContentView.swift
//  SportthtonTest
//
//  Created by Yolima Pereira Ruiz on 29/12/24.
//

import SwiftUI

struct AddProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            CurvedBackground()
            VStack{
                VStack(alignment: .leading) {
                    
                    Text("Add Your Profile Picture")
                        .font(.system(size: 37, weight: .medium))
                    //.multilineTextAlignment(.leading)
                    
                    
                    Text("Personalize Your Profile! Upload an image that \n reflects your best!")
                        .font(.system(size: 15, weight: .regular))
                        .padding(.top, 24)
                    
                }
                .padding(.top, 12)
                .padding(.leading, 24)
                
                
                //button to upload the image
                Button {
                    //upload image
                } label: {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [3]))
                        .frame(width: 361, height: 303)
                        .foregroundColor(.gray)
                        .overlay {
                            VStack {
                                
                                Image("tabler_photo-down")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 93, height: 93)
                                
                                
                                Text("Supported formats JPG, PNG or GIF. \n Max size:3MB")
                                    .font(.system(size: 13, weight: .regular))
                                    .foregroundColor(.black)
                                    .padding(.top, 35)
                            }
                        }
                }
                .padding(.top, 92)
                Spacer()
                //continue button
                
                NavigationLink(destination: TellUsAboutYou() ){
                    
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
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: TellUsAboutYou() ){
                    Text("Skip")
                        .foregroundStyle(Color.burdeosButton)
                }

            }
        }  
    }
        
}

#Preview {
    AddProfileView()
}

