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
                  //  .background(.clear)
                
                Spacer()
            }
            
            Divider()
            
            //Gender
            HStack {
                Text("Gender")
                    .font(.system(size: 15))
                    .foregroundStyle(.black.opacity(0.6))

                
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
                            .padding(.leading, 76)
                        Image(systemName: "chevron.down")
                            .font(.system(size: 14))
                            .foregroundStyle(.black)
                            .padding(.trailing)
                    }
                }
                
                Spacer()
            }
            
            Divider()
            
            //phone
            HStack {
                Text("Phone")
                    .font(.system(size: 15))
                    .foregroundStyle(.black.opacity(0.6))
                
                Text("+1")
                    .font(.system(size: 15))
                    .padding(.leading, 76)
                
                TextField("Enter your number", text: Binding (
                    get: { phone },
                    set: { newValue in
                        if newValue.filter(\.isNumber).count <= 10 {
                            phone = newValue.filter { $0.isNumber }
                        }
                    }
                ))
                .keyboardType(.phonePad)
                .multilineTextAlignment(.trailing)
                
                Spacer()
                    
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
    @State var phone: String = ""
    
    UserFormView(dob: $dob, gender: $gender, phone: $phone)
}
