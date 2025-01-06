//
//  UserFormView.swift
//  SportthtonTest
//
//  Created by Yolima Pereira Ruiz on 30/12/24.
//

import SwiftUI

struct UserFormView: View {
    @Binding var dob: Date
    @Binding var gender: String
    @Binding var phone: String
    
    private let genders = ["Male", "Female", "Other"]
    
    var body: some View {
        VStack(spacing: 24) {
            //DOB
            HStack {
                Text("DOB")
                    .font(.system(size: 15))
                    .foregroundStyle(.black.opacity(0.6))
                
                Spacer()
                
                DatePicker("", selection: $dob, displayedComponents: .date)
                    .labelsHidden()
                    .background(.clear)
            }
            
            Divider()
            
            //Gender
            HStack {
                Text("Gender")
                    .font(.system(size: 15))
                    .foregroundStyle(.black.opacity(0.6))
                
                Spacer()
                
                Menu {
                    ForEach(genders, id: \.self) { genderOption in
                        Button(action: {
                            gender = genderOption
                        }) {
                            Text(genderOption)
                        }
                    }
                } label: {
                    HStack {
                        Text(gender)
                            .font(.system(size: 15))
                            .foregroundStyle(.black)
                            .padding(.leading)
                        Image("chevron.down")
                            .font(.system(size: 14))
                            .foregroundStyle(.black)
                            .padding(.trailing)
                    }
                }
            }
            
            Divider()
            
            //phone
            HStack {
                Text("Phone")
                    .font(.system(size: 16))
                    .foregroundStyle(.black.opacity(0.6))
                
                Spacer()
                
                TextField("+1", text: $phone)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.phonePad)
                    
            }
            Divider()
        }
        .padding(.horizontal, 24)
        .frame(width: 364)
    }
}

#Preview {
    @State var dob: Date = Date()
    @State var gender: String = "Male"
    @State var phone: String = "+1"
    
    UserFormView(dob: $dob, gender: $gender, phone: $phone)
}
