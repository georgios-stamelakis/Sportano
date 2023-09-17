//
//  ExpTableCollectionViewCell.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 16/9/23.
//

import UIKit

class ExpTableCollectionViewCell: TableCollectionViewCell {

    var isExpanded: Bool

    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, isExpanded: Bool) {
        self.isExpanded = isExpanded

        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func expand() {

    }

    func collapse() {

    }

    func toogle() {
        if self.isExpanded {
            collapse()
        } else {
            expand()
        }
        self.isExpanded = !self.isExpanded
    }

}
