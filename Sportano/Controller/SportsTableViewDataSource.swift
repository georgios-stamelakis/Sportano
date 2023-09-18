//
//  SportsTableViewDataSource.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 17/9/23.
//

import UIKit

class SportsTableViewDataSource: NSObject, UITableViewDataSource {

    private var cellIdentifier: String
    private var headerCellIdentifier: String
    private var items: DataModel
    var configureCell: (TableCollectionViewCell, SportModel) -> () = { _, _ in }
    var configureHeaderCell: (SportHeaderViewCell, SportModel) -> () = { _, _ in }

    init(cellIdentifier: String, headerCellIdentifier: String, items: DataModel, configureCell: @escaping (TableCollectionViewCell, SportModel) -> (), configureHeaderCell: @escaping (SportHeaderViewCell, SportModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.headerCellIdentifier = headerCellIdentifier
        self.items = items
        self.configureCell = configureCell
        self.configureHeaderCell = configureHeaderCell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! TableCollectionViewCell

            let item = items[indexPath.section]
            self.configureCell(cell, item)

            return cell

        default:
            print("ERROR out of bounds - Simple Cell Created")
            return UITableViewCell()

        }
    }
}

extension SportsTableViewDataSource: ExpyTableViewDataSource {
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: headerCellIdentifier) as! SportHeaderViewCell

        let item = items[section]
        self.configureHeaderCell(cell, item)

        return cell
    }

    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
}

extension SportsTableViewDataSource: ExpyTableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {

    }

    // Acts as spacing to the top of the section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // Return the desired height for the section header
        return 2.0
    }

    // Acts as spacing to the bottom of the section
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        // Return the desired height for the section footer
        return 2.0
    }


    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
