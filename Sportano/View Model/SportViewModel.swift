//
//  SportsViewModel.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 15/9/23.
//

import Foundation

class SportsViewModel: NSObject {

    private var sportsApiService: SportsAPIService!
    private(set) var sportsData : DataModel! {
        didSet {
            self.bindSportViewModelToController()
        }
    }

    var bindSportViewModelToController : (() -> ()) = {}

    override init() {
        super.init()
        self.sportsApiService =  SportsAPIService()
        callFuncToGetSportData()
    }

    func callFuncToGetSportData() {
        self.sportsApiService.getSports { (data) in
            self.sportsData = data
        }
    }
}
