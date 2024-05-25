//
//  Payment.swift
//  Foodie
//
//  Created by Алина on 25.05.24.
//

import SwiftUI

struct Payment: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var totalPrice = 0.00
    @State private var selectedIndex = 0
    func calculateTotalPrice() {
        totalPrice = 0.00
        for i in 0..<cartItems.count {
            totalPrice += cartItems[i][2] as! Double
        }
    }
    var body: some View {
        NavigationView {
            
            ScrollView() {
                VStack {
                    Picker(selection: $selectedIndex, label :Text("")) {
                        Text("Credit Card").tag(0)
                        Text("Cash").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.green)
                        .opacity(0.8)
                        .frame(width: 350, height: 120)
                    VStack {
                        Text("Total Price")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .frame(width: 350, alignment: .leading)
                            .padding(.leading, 60)
                        Text("$\(String(format: "%.2f", totalPrice))")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .bold))
                            .frame(width: 350, alignment: .leading)
                            .padding(.leading, 60)
                    }
                    Button() {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder()
                                .frame(width: 120, height: 50)
                                .foregroundColor(.white)
                            Text("Confirm Pay")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }.offset(x: 80)
                }
                
            }.onAppear(perform: self.calculateTotalPrice)
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
            
    
        

struct Payment_Previews: PreviewProvider {
    static var previews: some View {
        Payment()
    }
}
