//
//  HorizontalCollectionViewCell.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 16/9/23.
//

import UIKit

class TableCollectionViewCell: UITableViewCell {

    static let identifier = "TableCollectionViewCell"

    var headerView: UIView!
    let headerLabel = UILabel()

    var collectionView: UICollectionView!

    var sportData: SportModel? {
        didSet {
            headerLabel.text = sportData?.sportName
        }
    }

//    var isExpanded = false

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Initialize the header view
        headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = bgSection // Customize the header appearance

        // Customize the header view for each cell

        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont.boldSystemFont(ofSize: 16)
        headerLabel.textColor = .white

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
        collectionView.dataSource = self

        // Add the header view and collection view to the cell's content view
        contentView.addSubview(headerView)
        headerView.addSubview(headerLabel)
        contentView.addSubview(collectionView)

        // Configure constraints for the header view
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 40) // Set the desired height
        ])

        // Configure constraints for the header label
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor)
        ])

        // Configure constraints for the collection view
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


// UICollectionViewDataSource methods

extension TableCollectionViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportData?.events.count ?? 0 // Return the number of items in the collection view
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalItemCollectionViewCell.identifier, for: indexPath) as! HorizontalItemCollectionViewCell

        print("Created collection view item for sport \(sportData?.sportName) - row \(indexPath.row) section \(indexPath.section) item \(indexPath.item)")

        print("GIORGOS COLLECTION GET 2")


        let myData = sportData?.events[indexPath.row]
        cell.bindData(sportData?.events[indexPath.row])

        return cell
    }


}

extension TableCollectionViewCell: UICollectionViewDelegateFlowLayout {

    // UICollectionViewDelegateFlowLayout method to set item size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 160) // Set the desired size for collection view items
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected item: \(indexPath.item) at row: \(indexPath.row) section: \(indexPath.section)")

        collectionView.deselectItem(at: indexPath, animated: true)
    }

}

