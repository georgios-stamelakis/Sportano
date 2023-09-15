//
//  SportModel.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 15/9/23.
//

import Foundation

class SportModel: Decodable {
    let sportId: String
    let sportName: String
    let events: [EventModel]

    enum CodingKeys: String, CodingKey {
        case sportId = "i"
        case sportName = "d"
        case events = "e"
    }
}

typealias DataModel = [SportModel]
