//
//  HorizontalItemCollectionViewCell.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 16/9/23.
//

import UIKit

class HorizontalItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HorizontalItemCollectionViewCell"

    var eventData: EventModel? {
        didSet {
            print("GIORGOS COLLECTION SET")

            guard var names = eventData?.eventName.components(separatedBy: " - ") else { return }
            //        titleLabel.text =
            while names.count < 2 {
                names.append("")
            }

            // FIXME: 1 line for each name for titleLabel.text
            titleLabel.numberOfLines = 2
            titleLabel.lineBreakMode = .byTruncatingTail
            titleLabel.text = names.joined(separator: "\n")

            // FIXME: Change timeLabel.text to time
            if let sportID = eventData?.sportId {
                timeLabel.text = sportID
            }
            //        if let time = eventData?.eventTime {
            //            timeLabel.text = String(time)
            //        }
        }
    }

    var titleLabel: UILabel!
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

        // Create and configure titleLabel
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .clear
        titleLabel.font = UIFont.systemFont(ofSize: 16)

        // Add the elements to the background view
        backgroundView.addSubview(timeLabel)
        backgroundView.addSubview(favButton)
        backgroundView.addSubview(titleLabel)

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
            favButton.bottomAnchor.constraint(equalTo: titleLabel.topAnchor),
            favButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            favButton.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),

            // Configure constraints for the title label
            titleLabel.topAnchor.constraint(equalTo: favButton.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonTapped() {
        print("Button is \(favButton.isEnabled)")
        favButton.isSelected.toggle()
    }

    deinit {
        print("DESTRUCTION: Collection View Cell")
    }


}
