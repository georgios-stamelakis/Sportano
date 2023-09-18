//
//  EventsCollectionViewDataSource.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 17/9/23.
//

import UIKit

class EventsCollectionViewDataSource: NSObject, UICollectionViewDataSource {

    private var cellIdentifier: String
    private var items: [EventModel]
    var configureCell: (HorizontalItemCollectionViewCell, EventModel) -> () //= { _, _ in }

    init(cellIdentifier: String, items: [EventModel], configureCell: @escaping (HorizontalItemCollectionViewCell, EventModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! HorizontalItemCollectionViewCell

        print("Created collection view item for sport \(String(describing: cell.eventData?.sportId)) - row \(indexPath.row) section \(indexPath.section) item \(indexPath.item)")

        print("GIORGOS COLLECTION GET 2")

//        items[indexPath.item].indexPath = indexPath
        let item = items[indexPath.item]


        let unixTime = TimeInterval(item.eventTime)
        let date = Date(timeIntervalSince1970: unixTime)
        let currentDate = Date()
        let timeInterval = date.timeIntervalSince(currentDate)

        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad

        // Format the time interval as HH:MM:SS
        if let formattedInterval = formatter.string(from: abs(timeInterval)) {
            print("Time remaining: \(formattedInterval)")
            cell.timeLabel.text = formattedInterval
        } else {
            print("Invalid date components")
            cell.timeLabel.text = "Expired"
        }

        self.configureCell(cell, item)

        return cell
    }
}

extension EventsCollectionViewDataSource: HorizontalItemCollectionViewCellDelegate {

    func buttonTapped(in cell: HorizontalItemCollectionViewCell, setFavoriteStateTo: Bool) {


        print("Button Tapped Delegate")
        print(cell.eventData?.eventName)
        print(cell.eventData?.originalPosition)

        cell.eventData?.isFavorite = setFavoriteStateTo


        items = DataFormatter().sortEventsByFavorites(events: items)


        if let item = cell.eventData {
            self.configureCell(cell, item)
        }
    }


}
