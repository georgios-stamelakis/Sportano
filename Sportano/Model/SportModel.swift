//
//  SportModel.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 15/9/23.
//

import Foundation

struct SportModel: Decodable {
    let sportId: String
    let sportName: String
    let events: [EventModel]

    var isCollapsed = true

    enum CodingKeys: String, CodingKey {
        case sportId = "i"
        case sportName = "d"
        case events = "e"
    }
}

typealias DataModel = [SportModel]
