//
//  Settings.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

struct Settings: View {
    
    @State var isOn = false
    var body: some View {

            HStack {
                Toggle(isOn: $isOn) {
                Text("Dark theme")
                }
            }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
