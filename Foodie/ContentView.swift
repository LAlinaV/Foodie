//
//  ContentView.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var changeScreen = false
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Text("We deliver\n grocery at your\n doorstep")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                Text("Grocerr gives you fresh vegetables and fruits,\nOrder fresh at grocerr")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Button() {
                    changeScreen = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                        Text("Login")
                            .foregroundColor(.white)
                            .bold()
                    }
                }.frame(width: 200, height: 35)
                    .foregroundColor(.green)
            
            .navigationViewStyle(StackNavigationViewStyle())
            .fullScreenCover(isPresented: $changeScreen) {
                Shop()
            }
                Button() {
                    changeScreen = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                        Text("Register")
                            .foregroundColor(.white)
                            .bold()
                    }
                }.frame(width: 200, height: 35)
                    .foregroundColor(.green)
            
            .navigationViewStyle(StackNavigationViewStyle())
            .fullScreenCover(isPresented: $changeScreen) {
                Registration()
            }
                
        }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

}
