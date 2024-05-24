//
//  Registration.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

struct SecureTextField: View {
    
    @State private var isSecureField: Bool = true
    @Binding var text: String
    
    var body: some View {
        if #available(iOS 15.0, *) {
            HStack {
                if isSecureField {
                    SecureField("Password", text: $text)
                } else {
                    TextField("Password", text: $text)
                }
            }.overlay(alignment: .trailing) {
                Image(systemName: isSecureField ? "eye.slash": "eye")
                    .onTapGesture {
                        isSecureField.toggle()
                    }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}


struct Registration: View {
    @State private var email = ""
    @State private var login = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isPasswordInputSecure = true
    @State private var isConfirmPasswordInputSecure = true
    @State private var isInputValid = false
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            VStack(alignment: .leading, spacing: 5) {
                Text("Enter login")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                TextField("Login", text: $login)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Enter email")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Enter password")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                SecureTextField(text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Confirm password")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                SecureTextField(text: $confirmPassword)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
            }
            
            VStack() {
                Spacer()
                Button(action: {
                    if (!email.isEmpty && !login.isEmpty && !password.isEmpty && !confirmPassword.isEmpty && password == confirmPassword) {
                        UserDefaults.standard.setValue(email, forKey: "email")
                        UserDefaults.standard.setValue(login, forKey: "login")
                        UserDefaults.standard.setValue(password, forKey: "password")

                        isInputValid = true
                        showAlert = false
                    }
                    else {
                        isInputValid = false
                        showAlert = true
                    }
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(.green)
                        Text("Confirm")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .frame(width: 200, height: 35)
                .fullScreenCover(isPresented: $isInputValid) {
                    Shop()
                }
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("There is a mistake in your input. \nCheck if all fields are filled and if passwords are the same"), dismissButton: .default(Text("OK")))
        }
    }
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
    }
}
