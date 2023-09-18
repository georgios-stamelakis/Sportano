//
//  SportHeaderViewCell.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 18/9/23.
//

import UIKit

class SportHeaderViewCell: UITableViewCell {

    static let identifier = "SportHeaderViewCell"

    var headerView: UIView!
    let headerLabel = UILabel()

    var sportData: SportModel? {
        didSet {
            headerLabel.text = sportData?.sportName
        }
    }

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

        // Add the header view and collection view to the cell's content view
        contentView.addSubview(headerView)
        headerView.addSubview(headerLabel)

        NSLayoutConstraint.activate([
            // Configure constraints for the header view
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 40), // Set the desired height for HeaderView

            // Configure constraints for the header label
            headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor)
        ])

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("DESTRUCTION: HeaderViewCell")
    }

}
