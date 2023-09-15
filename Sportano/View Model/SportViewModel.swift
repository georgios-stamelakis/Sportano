//
//  SportsViewModel.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 15/9/23.
//

import Foundation

class SportsViewModel {
    private var sourceURL = URL(string: "https://618d3aa7fe09aa001744060a.mockapi.io/api/sports")!
    var dataModel: DataModel?

    func getSports(completion: @escaping () -> ()) {
        URLSession.shared.dataTask(with: sourceURL) { [weak self] data, response, error in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                do {
                    let result = try jsonDecoder.decode(DataModel.self, from: data)
                    self?.dataModel = result
                } catch {
                    // Handle the error here
                    print("Error decoding data")
                }

            }
        }.resume()
    }
}
