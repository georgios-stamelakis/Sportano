//
//  TableCollectionViewCell.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 16/9/23.
//

import UIKit

class TableCollectionViewCell: UITableViewCell {

    static let identifier = "TableCollectionViewCell"

    var collectionView: UICollectionView!

    var sportData: SportModel? {
        didSet {
            updateDataSource()
        }
    }
    
    private var dataSource : EventsCollectionViewDataSource!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Initialize the collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        // Initialize the collection view
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear

        // Register a custom cell for the collection view
        collectionView.register(HorizontalItemCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalItemCollectionViewCell.identifier)

        // Set the delegate and dataSource
        collectionView.delegate = self

        // Add the collection view to the cell's content view
        contentView.addSubview(collectionView)

        // Configure constraints for the collection view
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 180) // Set height for the CollectionView
        ])

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.collectionView.reloadData()

        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateDataSource() {
        guard let events = sportData?.events else {
            print("ERROR events is NIL")
            return
        }
        self.dataSource = EventsCollectionViewDataSource(cellIdentifier: HorizontalItemCollectionViewCell.identifier, items: events, configureCell: { (cell, eventData) in
            cell.eventData = eventData
            cell.delegate = self
        })

        DispatchQueue.main.async {
            self.collectionView.dataSource = self.dataSource
            self.collectionView.reloadData()
        }
    }

    deinit {
        print("DESTRUCTION: TableViewCell")
    }

}

extension TableCollectionViewCell: UICollectionViewDelegateFlowLayout {

    // UICollectionViewDelegateFlowLayout method to set item size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 160)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        collectionView.deselectItem(at: indexPath, animated: true)
    }

}

extension TableCollectionViewCell: HorizontalItemCollectionViewCellDelegate {

    func buttonTapped(in cell: HorizontalItemCollectionViewCell, setFavoriteStateTo: Bool) {

        dataSource.notifyOnButtonPress(cell: cell, setFavoriteStateTo: setFavoriteStateTo, collectionView: self.collectionView)

        self.collectionView.reloadData()
    }

}
