//
//  MainCoordinator.swift
//  NYCSchools
//
//  Created by Harshavardhan Tadiparthi on 18/08/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let apiManager = APIManager()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SchoolsListViewController.instantiate()
        let converterViewModel = SchoolsListViewModel(apiManager: self.apiManager)
        vc.viewModel = converterViewModel
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func loadSchoolDetailsViewController(school:SchoolsListResponseModel, satresults:SatScoresResponseModel) {
        let vc = SchoolDetailsViewController.instantiate()
        let converterViewModel = SchoolDetailsViewModel(apiManager: self.apiManager, SelectedSchool: school, SatResults: satresults)
        vc.viewModel = converterViewModel
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}
