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
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: headerCellIdentifier, for: indexPath) as! SportHeaderViewCell

            print("Created table row  - row \(indexPath.row) section \(indexPath.section) item \(indexPath.item) : for sport \(String(describing: cell.sportData?.sportName))")
            print("GIORGOS TABLE GET 2")

            let item = items[indexPath.section]
            self.configureHeaderCell(cell, item)

            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableCollectionViewCell


            print("Created table row  - row \(indexPath.row) section \(indexPath.section) item \(indexPath.item) : for sport \(String(describing: cell.sportData?.sportName))")

            print("GIORGOS TABLE GET 2")

            let item = items[indexPath.section]
            self.configureCell(cell, item)

            return cell

        default:
            print("ERROR out of bounds - CELL not created")
            return UITableViewCell()

        }
    }
}



// FROM VIEW CONTROLLER
//{
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: TableCollectionViewCell.identifier, for: indexPath) as! TableCollectionViewCell
//
//        print("Created table row  - row \(indexPath.row) section \(indexPath.section) item \(indexPath.item) : for sport \(sportsViewModel.sportsData[indexPath.row].sportName)")
//
//        print("GIORGOS TABLE GET 2")
//
//        let myData = sportsViewModel.sportsData[indexPath.row]
//        cell.bindData(sportsViewModel.sportsData?[indexPath.row])
//
//
//        return cell
//    }
//
//}

extension SportsTableViewDataSource: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User selected table at row:\(indexPath.row + 1) section:\(indexPath.section + 1) item: \(indexPath.item + 1)")

        tableView.deselectRow(at: indexPath, animated: true)

        // FIXME: Remove this if not needed

        self.items[indexPath.row].isCollapsed.toggle()
//        tableView.reloadRows(at: [indexPath], with: .fade)
        
        tableView.reloadData()
    }

}
