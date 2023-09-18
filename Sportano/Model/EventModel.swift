//
//  EventModel.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 15/9/23.
//

import Foundation

class EventModel: Decodable {
    let eventId: String
    let sportId: String
    let eventName: String
    let eventTime: Int // unix time
    //TODO: check if there is another struct for event_start_time

    var indexPath = IndexPath()
    var isFavorite = false

    enum CodingKeys: String, CodingKey {
        case eventId = "i"
        case sportId = "si"
        case eventName = "d"
        case eventTime = "tt"
    }
}
