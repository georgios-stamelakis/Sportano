//
//  ViewController.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 15/9/23.
//

import UIKit

class ViewController: UITableViewController,
                      UICollectionViewDelegate,
                      UICollectionViewDataSource,
                      UICollectionViewDelegateFlowLayout
{


    let sportsListTable = UITableView()
//    let myFlowLayout = UICollectionViewFlowLayout()
    var mySampleCollectionView: UICollectionView?


    var viewModel = SportsViewModel()
    var sportsData: DataModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // -- collection view
        let myFlowLayout = UICollectionViewFlowLayout()
        myFlowLayout.scrollDirection = .horizontal

        mySampleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: myFlowLayout)

        guard let sampleCollectionView = mySampleCollectionView else { return }

        sampleCollectionView.register(EventCell.self, forCellWithReuseIdentifier: EventCell.identifier)
        sampleCollectionView.isPagingEnabled = false

        sampleCollectionView.delegate = self
        sampleCollectionView.dataSource = self

        view.addSubview(sampleCollectionView)

        // collection view --

//        self.view.backgroundColor = UIColor.black
//        self.view.addSubview(self.sampleLabel)
//        self.setUpConstraints()

//        self.customizeHorizontalView()


        viewModel.getSports { [weak self] in
            self?.sportsData = self?.viewModel.dataModel
            // reload data here
        }

//        override func viewDidLayoutSubviews() {
//            super.viewDidLayoutSubviews()
//            mySampleCollectionView.frame = view.bounds
//        }

    }

//    func setUpConstraints() {
//            let sampleLabelConstraints = [
//                self.sampleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//                self.sampleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//            ]
//            NSLayoutConstraint.activate(sampleLabelConstraints)
//        }

//    func customizeHorizontalView() {
//        let scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(scrollView)
//
//        scrollView.backgroundColor = .systemPink
//
//        let label1 = UILabel()
//        label1.backgroundColor = .brown
//        label1.text = "Item 1"
//
//        let label2 = UILabel()
//        label1.backgroundColor = .yellow
//        label2.text = "Item 2"
//
//        let label3 = UILabel()
//        label1.backgroundColor = .red
//        label3.text = "Item 3"
//
//        scrollView.addSubview(label1)
//        scrollView.addSubview(label2)
//        scrollView.addSubview(label3)
//
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//            label1.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            label1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//
//            label2.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            label2.leadingAnchor.constraint(equalTo: label1.trailingAnchor, constant: 16), // Adjust the spacing between items
//
//            label3.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            label3.leadingAnchor.constraint(equalTo: label2.trailingAnchor, constant: 16), // Adjust the spacing between items
//            label3.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
//        ])
//
//        scrollView.isPagingEnabled = false // Set to true if you want to snap to pages
//        scrollView.showsHorizontalScrollIndicator = true
//
//        let totalContentWidth: Double = 200
//        scrollView.contentSize = CGSize(width: totalContentWidth, height: scrollView.bounds.height)
//
//    }

}

