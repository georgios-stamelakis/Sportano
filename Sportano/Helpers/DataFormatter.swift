//
//  DataFormatter.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 18/9/23.
//

import Foundation

class DataFormatter {

    func setOriginalPositions(data: DataModel) -> DataModel {
        for sport in data {
            var index = 0
            for event in sport.events {
                event.originalPosition = index
                index += 1
            }
        }
        return data
    }

    func sortEventsByFavorites(events: [EventModel]) -> [EventModel] {
//        return events.sorted(by: {a, b in
//            if a.isFavorite && !b.isFavorite { return true }
//            return a.originalPosition < b.originalPosition
//        })

        let sortedArray = events.sorted { (element1, element2) in
            // Sort by boolean values first (true comes before false)
            if element1.isFavorite && !element2.isFavorite {
                return true
            } else if !element1.isFavorite && element2.isFavorite {
                return false
            }

            // If boolean values are the same, sort by integer values
            return element1.originalPosition < element2.originalPosition
        }
        return sortedArray
    }

}
