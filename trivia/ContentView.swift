//
//  ContentView.swift
//  trivia
//
//  Created by Bobby on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 50) {
                HStack {
                    Spacer()
                    Image(systemName: "line.3.horizontal")
                    Spacer()
                    Text("Title")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.blue))
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                
                ProgressView(value: 0.9)
                    .progressViewStyle(LinearProgressViewStyle())
                    .frame(height: 20)
                    .foregroundColor(Color(.purple))
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    .padding(.bottom, 20)
                    .scaleEffect(x: 1, y: 4, anchor: .center)
            }

            Text("What is the capital of Ireland?")
                .bold()
            
            VStack(spacing: 10) {
                Button("Galway") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.green))
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                
                Button("Dublin") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.green))
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                
                Button("Cork") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.green))
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                
                Button("Belfast") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.green))
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
            }
            .padding()
            
            ProgressView(value: 0.5)
                .progressViewStyle(LinearProgressViewStyle())
                .frame(height: 20)
                .foregroundColor(Color(.orange))
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                .scaleEffect(x: 1, y: 4, anchor: .center)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
