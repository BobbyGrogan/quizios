//
//  catButton.swift
//  bruh
//
//  Created by Bobby Grogan on 6/18/23.
//
import SwiftUI

struct catButton: View {
    let name: String
    let backColor: Color = Color(red: 0.8, green: 0.3, blue: 0.1)
    var body: some View {
        Text(name)
            .padding()
            .background(Color(red: 0.8, green: 0.3, blue: 0.1))
            .cornerRadius(20)
            .shadow(radius: 10)
    }
}

struct catButton_Previews: PreviewProvider {
    static var previews: some View {
        catButton(name: "Country Capitals")
    }
}
