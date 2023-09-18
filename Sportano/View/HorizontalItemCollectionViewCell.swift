//
//  HorizontalItemCollectionViewCell.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 16/9/23.
//

import UIKit

protocol HorizontalItemCollectionViewCellDelegate: AnyObject {
    func buttonTapped(in cell: HorizontalItemCollectionViewCell, setFavoriteStateTo: Bool)
}

class HorizontalItemCollectionViewCell: UICollectionViewCell {

    weak var delegate: HorizontalItemCollectionViewCellDelegate?

    static let identifier = "HorizontalItemCollectionViewCell"

    var eventData: EventModel? {
        didSet {
            favButton.isSelected = eventData?.isFavorite ?? false

            guard var names = eventData?.eventName.components(separatedBy: " - ") else { return }
            while names.count < 2 {
                names.append("")
            }
            titleLabelFirstName.text = names[0]
            titleLabelSecondName.text = names[1]
        }
    }

    var titleLabelFirstName: UILabel!
    var titleLabelSecondName: UILabel!

    var timeLabel: UILabel!

    var favButton = UIButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Create a rounded background view
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = mainColor1
        backgroundView.layer.cornerRadius = 8
        contentView.addSubview(backgroundView)

        // Create and configure timeLabel
        timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textAlignment = .center
        timeLabel.textColor = .white
        timeLabel.backgroundColor = .clear
        timeLabel.font = UIFont.systemFont(ofSize: 16)

        // Create and configure favButton
        favButton = UIButton(type: .custom)
        favButton.translatesAutoresizingMaskIntoConstraints = false
        let normalImage = UIImage(named: "star.fill.grey")
        favButton.setImage(normalImage, for: .normal)
        let selectedImage = UIImage(named: "star.fill.yellow")
        favButton.setImage(selectedImage, for: .selected)
        favButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        favButton.isEnabled = true
        favButton.isSelected = eventData?.isFavorite ?? false


        // Create and configure titleLabel
        titleLabelFirstName = UILabel()
        titleLabelFirstName.translatesAutoresizingMaskIntoConstraints = false
        titleLabelFirstName.textAlignment = .center
        titleLabelFirstName.textColor = .white
        titleLabelFirstName.backgroundColor = .clear
        titleLabelFirstName.font = UIFont.systemFont(ofSize: 16)

        titleLabelSecondName = UILabel()
        titleLabelSecondName.translatesAutoresizingMaskIntoConstraints = false
        titleLabelSecondName.textAlignment = .center
        titleLabelSecondName.textColor = .white
        titleLabelSecondName.backgroundColor = .clear
        titleLabelSecondName.font = UIFont.systemFont(ofSize: 16)

        // Add the elements to the background view
        backgroundView.addSubview(timeLabel)
        backgroundView.addSubview(favButton)
        backgroundView.addSubview(titleLabelFirstName)
        backgroundView.addSubview(titleLabelSecondName)

        // Add the background view to the cell's content view
        contentView.addSubview(backgroundView)

        // Configure elements constraints
        NSLayoutConstraint.activate([

            // Configure constraints for the background view
            backgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            // Configure constraints for the time label
            timeLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: favButton.topAnchor),

            // Configure constraints for the favorite button
            favButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            favButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            favButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            favButton.bottomAnchor.constraint(equalTo: titleLabelFirstName.topAnchor, constant: -10),
            favButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            favButton.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor, constant: -20),
            favButton.heightAnchor.constraint(equalToConstant: 50),
            favButton.widthAnchor.constraint(equalToConstant: 50),

            // Configure constraints for the title labels
            titleLabelFirstName.topAnchor.constraint(equalTo: favButton.bottomAnchor, constant: 10),
            titleLabelFirstName.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            titleLabelFirstName.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            titleLabelFirstName.bottomAnchor.constraint(equalTo: titleLabelSecondName.topAnchor),

            titleLabelSecondName.topAnchor.constraint(equalTo: titleLabelFirstName.bottomAnchor),
            titleLabelSecondName.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            titleLabelSecondName.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            titleLabelSecondName.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonTapped() {
        delegate?.buttonTapped(in: self, setFavoriteStateTo: !favButton.isSelected)
    }

    deinit {
        print("DESTRUCTION: Collection View Cell")
    }

}
