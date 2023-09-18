//
//  SportHeaderViewCell.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 18/9/23.
//

import UIKit

class SportHeaderViewCell: UITableViewCell {

    let imageViewArrow = UIImageView(image: UIImage(named: "chevron.right.white"))

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
        headerView.layer.cornerRadius = 16

        // Customize the header view for each cell

        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont.boldSystemFont(ofSize: 16)
        headerLabel.textColor = .white
        headerLabel.textAlignment = .center

        // Customize the arrow image view for each cell
        imageViewArrow.translatesAutoresizingMaskIntoConstraints = false

        // Add the header view and collection view to the cell's content view
        contentView.addSubview(headerView)
        headerView.addSubview(headerLabel)
        headerView.addSubview(imageViewArrow)

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
            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),

            // Configure constraints for the image arrow
            imageViewArrow.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
//            imageViewArrow.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            imageViewArrow.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            imageViewArrow.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10)
        ])

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("DESTRUCTION: HeaderViewCell")
    }

}

extension SportHeaderViewCell: ExpyTableViewHeaderCell {

    func changeState(_ state: ExpyState, cellReuseStatus cellReuse: Bool) {

        switch state {
        case .willExpand:
            print("WILL EXPAND")
            hideSeparator()
            arrowDown(animated: true)

        case .willCollapse:
            print("WILL COLLAPSE")
            arrowRight(animated: true)

        case .didExpand:
            print("DID EXPAND")

        case .didCollapse:
            showSeparator()
            print("DID COLLAPSE")
        }
    }

    // FIXME: Find out why the animation on the arrow is not working...
    private func arrowDown(animated: Bool) {
        UIView.animate(withDuration: (animated ? 0.3 : 0)) {
            self.imageViewArrow.transform = CGAffineTransform(rotationAngle: (CGFloat.pi / 2))
        }
    }

    private func arrowRight(animated: Bool) {
        UIView.animate(withDuration: (animated ? 0.3 : 0)) {
            self.imageViewArrow.transform = CGAffineTransform(rotationAngle: 0)
        }
    }

    // TODO: Implement or remove these functions here. Probably useless for my case
    func showSeparator() {

    }

    func hideSeparator() {

    }

}
