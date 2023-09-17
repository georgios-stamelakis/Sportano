//
//  HorizontalCollectionViewCell.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 16/9/23.
//

import UIKit

class TableCollectionViewCell: UITableViewCell {

    static let identifier = "TableCollectionViewCell"

    var containerStackView: UIStackView!
    var headerView: UIView!
    let headerLabel = UILabel()

    var collectionView: UICollectionView!

//    var isCellCollapsed: Bool?

    var sportData: SportModel? {
        didSet {
            headerLabel.text = sportData?.sportName

            updateCell()

            // TODO: Move update from here so that its called only once per collectionView
            updateDataSource()
        }
    }

    // TODO: Move this to ViewController if possible
    private var dataSource : EventsCollectionViewDataSource!


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
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal

        // Initialize the collection view
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear

        // Register a custom cell for the collection view
        collectionView.register(HorizontalItemCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalItemCollectionViewCell.identifier)

        // Set the delegate and dataSource
        collectionView.delegate = self
//        collectionView.dataSource = dataSource

        // Add the header view and collection view to the cell's content view
//        contentView.addSubview(headerView)
        headerView.addSubview(headerLabel)
//        contentView.addSubview(collectionView)


        // --- Stack View

        containerStackView = UIStackView()
        containerStackView.axis = .vertical // Set the axis (vertical or horizontal) as per your design.
        containerStackView.spacing = 8 // Adjust the spacing between views as needed.
        containerStackView.translatesAutoresizingMaskIntoConstraints = false // If using Auto Layout.
        contentView.addSubview(containerStackView) // Add the stack view to your view hierarchy.

        // Customize the views as needed (set background color, labels, buttons, etc.).
        containerStackView.addArrangedSubview(headerView)
        containerStackView.addArrangedSubview(collectionView)
        // Stack View ---

        NSLayoutConstraint.activate([
            // Configure constraints for the header view
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 40), // Set the desired height for HeaderView

            // Configure constraints for the header label
            headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),

            // Configure constraints for the collection view
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: collectionView.isHidden ? 0 : 180) // Set height for the CollectionView
        ])

//        UICollectionView.
//        preferredLayoutAttributesFitting

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateDataSource() {
        // TODO: Define what the identifier might be here
        guard let events = sportData?.events else {
            print("ERROR events is NIL")
            return
        }
        self.dataSource = EventsCollectionViewDataSource(cellIdentifier: HorizontalItemCollectionViewCell.identifier, items: events, configureCell: { (cell, eventData) in
            cell.eventData = eventData
        })

        DispatchQueue.main.async {
            self.collectionView.dataSource = self.dataSource
            self.collectionView.reloadData()
        }
    }

    func updateCell() {

        let willCellCollapse = sportData?.isCollapsed ?? true

        collectionView.isHidden = willCellCollapse

        NSLayoutConstraint.activate([
//            // Configure constraints for the header view
//            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            headerView.heightAnchor.constraint(equalToConstant: 40), // Set the desired height for HeaderView
//
//            // Configure constraints for the header label
//            headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
//            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
//            headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
//            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
//
//            // Configure constraints for the collection view
//            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: willCellCollapse ? 20 : 180)
            // Set height for the CollectionView
        ])

    }

    deinit {
        print("DESTRUCTION: TableViewCell")
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

    //// UICollectionViewDelegateFlowLayout methods
    //
    //func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //    return 1
    //}
    //
    //func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //    return 1
    //}

}

