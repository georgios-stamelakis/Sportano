//
//  ViewController.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 15/9/23.
//

import UIKit

class ViewController: UIViewController {

    var viewModel = SportsViewModel()
    var sportsData: DataModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.getSports { [weak self] in
            self?.sportsData = self?.viewModel.dataModel
            // reload data here
        }

    }


}

