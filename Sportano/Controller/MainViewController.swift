//
//  NewViewController.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 16/9/23.
//

import UIKit

class MainViewController: UIViewController {

    let tableView = UITableView()

    //    private var viewModel = SportsViewModel()
    private var sportsViewModel: SportsViewModel!
    private var dataSource : SportsTableViewDataSource!


    //    var sportsData: DataModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        callToViewModelForUIUpdate()
    }

    func callToViewModelForUIUpdate() {

        self.sportsViewModel =  SportsViewModel()
        self.sportsViewModel.bindSportViewModelToController = {
            self.updateDataSource()
        }
    }

    func updateDataSource(){
        // TODO: Define what the identifier might be here
        self.dataSource = SportsTableViewDataSource(cellIdentifier: TableCollectionViewCell.identifier, items: sportsViewModel.sportsData, configureCell: { (cell, sportData) in
            cell.sportData = sportData

        })

        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }

    func setupUI() {
        // Customize the title and background color of the navigation bar
        title = "Sportano"
        navigationController?.navigationBar.barTintColor = bgNavigation
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: labelColor]
        navigationController?.navigationBar.prefersLargeTitles = true

        self.tableView.frame = view.bounds
//        self.tableView.dataSource = self
        self.tableView.delegate = self

        // Register the custom table view cell
        self.tableView.register(TableCollectionViewCell.self, forCellReuseIdentifier: TableCollectionViewCell.identifier)

        view.addSubview(self.tableView)
    }

}


extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User selected table at row:\(indexPath.row) section:\(indexPath.section) item: \(indexPath.item)")

        tableView.deselectRow(at: indexPath, animated: true)

        // FIXME: Remove this if not needed
        self.tableView.reloadData()
    }

}
