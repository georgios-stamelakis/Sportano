//
//  Info.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 18/9/23.
//

import SwiftUI

@available(iOS 13.0, *)
struct ContentView: View {
    var body: some View {
        VStack {
            Image("darth.vader.avatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .clipShape(Circle())

            Text("Georgios Stamelakis")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text("iOS Software Engineer")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 5)
            
            Text("https://www.linkedin.com/in/giorgos-stamelakis-082526216/")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 5)

            Spacer()

            Text("Enjoy scrolling Sport Events!")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 5)

            Text("Thank you for your time.")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 5)
            
            Spacer()

        }
        .padding()
    }
}

@available(iOS 13.0, *)
struct SwiftUIWrapperView: View {
    var body: some View {
        ContentView()
    }
}
