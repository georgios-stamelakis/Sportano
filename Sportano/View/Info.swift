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
            Image("your_image_filename") // Replace with your image's filename
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200) // Adjust the size as needed
                .clipShape(Circle()) // Optionally clip the image to a circle shape

            Text("Your Name")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text("Your Job Title")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 5)

            Spacer()
        }
        .padding()
    }
}

@available(iOS 13.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
