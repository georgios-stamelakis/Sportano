//
//  NewViewController.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 16/9/23.
//

import UIKit

weak var timer: Timer?
var componentsFormatter: DateComponentsFormatter = {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    return formatter
}()

class MainViewController: UIViewController {

    let tableView = ExpyTableView()

    private var sportsViewModel: SportsViewModel!
    private var dataSource : SportsTableViewDataSource!


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

    func updateDataSource() {
        // TODO: Define what the identifier might be here
        self.dataSource = SportsTableViewDataSource(
            cellIdentifier: TableCollectionViewCell.identifier,
            headerCellIdentifier: SportHeaderViewCell.identifier,
            items: sportsViewModel.sportsData,

            configureCell: { (cell, sportData) in
                cell.sportData = sportData
            },
            configureHeaderCell: { (cell, sportData) in
                cell.headerLabel.text = sportData.sportName
            })

        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate = self.dataSource
            self.tableView.reloadData()
            print("RELOAD DATA table was Called")
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
//        self.tableView.delegate = dataSource
//        self.tableView.estimatedRowHeight = 180
//        self.tableView.rowHeight = UITableView.automaticDimension

        // Register the custom table view cell
        self.tableView.register(TableCollectionViewCell.self, forCellReuseIdentifier: TableCollectionViewCell.identifier)
        self.tableView.register(SportHeaderViewCell.self, forCellReuseIdentifier: SportHeaderViewCell.identifier)

//        self.tableView.tableFooterView = UIView()
//        self.tableView.tableHeaderView = UIView()

        let settingsImage = UIImage(named: "settings_icon")
        let settingsButton = UIBarButtonItem(image: settingsImage, style: .plain, target: self, action: #selector(settingsButtonTapped))
        navigationItem.rightBarButtonItem = settingsButton
        navigationController?.setNavigationBarHidden(false, animated: false)


        view.addSubview(self.tableView)
    }


    @objc private func orientationDidChange() {
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown, .landscapeLeft, .landscapeRight:
            tableView.reloadSections(IndexSet(Array(tableView.expandedSections.keys)), with: .none)
        default:break
        }
    }

    @objc func settingsButtonTapped() {
        

    }

}
