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

        let item = items[indexPath.item]
        self.configureCell(cell, item)

        return cell
    }
}
