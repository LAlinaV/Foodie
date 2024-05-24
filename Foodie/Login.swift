//
//  Login.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

struct Login: View {
    @State private var login = ""
    @State private var password = ""
    @State private var isPasswordInputSecure = true
    @State private var isInputValid = false
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            
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
                Text("Enter password")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                SecureTextField(text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
            }
            
            VStack() {
                Spacer()
                Button(action: {
                    if (!login.isEmpty && !password.isEmpty &&
                        (UserDefaults.standard.value(forKey: "login") != nil) && (UserDefaults.standard.value(forKey: "password") != nil) &&
                        (UserDefaults.standard.value(forKey: "login") as! String == login) && (UserDefaults.standard.value(forKey: "password") as! String == password)) {

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
            Alert(title: Text("Error"), message: Text("There is a mistake in your input. \nCheck if all fields are filled and if your input is correct"), dismissButton: .default(Text("OK")))
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
            }
            
        }
        }
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
