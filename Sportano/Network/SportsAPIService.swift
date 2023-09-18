//
//  SportsAPIService.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 17/9/23.
//

import Foundation

class SportsAPIService: NSObject {
    private var sourceURL = URL(string: "https://618d3aa7fe09aa001744060a.mockapi.io/api/sports")!

    func getSports(completion: @escaping (DataModel) -> ()) {
        URLSession.shared.dataTask(with: sourceURL) { data, response, error in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                do {
                    let result = try jsonDecoder.decode(DataModel.self, from: data)
                    completion(DataFormatter().setOriginalPositions(data: result))
                } catch {
                    // Handle the error here
                    print("Error decoding data")
                }

            }
        }.resume()
    }
}
