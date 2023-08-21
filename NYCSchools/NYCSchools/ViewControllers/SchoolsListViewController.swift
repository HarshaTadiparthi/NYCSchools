//
//  ViewController.swift
//  NYCSchools
//
//  Created by Harshavardhan Tadiparthi on 18/08/23.
//

import UIKit
import SwiftUI

class SchoolsListViewController: UIViewController,Storyboarded {


    @IBOutlet weak var schoolsListTable: UITableView!
    
    // MARK: - Properties
    weak var coordinator: MainCoordinator?
    var viewModel : SchoolsListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = AppStrings.SCHOOLS_SCREEN_TITLE
        self.configureErrorHandler()
        self.initiateDataModelUpdate()
        self.fetchSchoolsList()

    }
    
    //Bind ResponseModeldata to UI
    func initiateDataModelUpdate() {
        self.viewModel.updateDataToView = { [weak self] model in
            guard model != nil else {
                return
            }
            DispatchQueue.main.async {
                self?.schoolsListTable.reloadData()
            }
        }
    }
    
    //set error handler
    private func configureErrorHandler(){
        viewModel.errorHandler = {[weak self] error in
            self?.presentSimpleAlert(title:AppStrings.Error, message: error)
        }
    }
    


    //MARK: - API
    private func fetchSchoolsList() {
        viewModel.fetchSchoolsList { status in
            if status {
                self.showActivity()
            } else {
                self.hideActivity()
            }
        }
    }
}


extension SchoolsListViewController: UITableViewDataSource, UITableViewDelegate {
    // This method declares the number of sections that we want in our table.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // This method declares how many rows are the in the table
    // We want this to be the number of current search results that the
    // Completer has generated for us
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.SchoolsList.count
    }
    
    // This method delcares the cells that are table is going to show at a particular index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the specific searchResult at the particular index
        let searchResult = self.viewModel.SchoolsList[indexPath.row]
        //Create  a new UITableViewCell object
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "SchoolsListCell")
        cell.accessoryType = .disclosureIndicator
        //Set the content of the cell to our searchResult data
        cell.textLabel?.text = searchResult.schoolName
        cell.detailTextLabel?.text = searchResult.schoolEmail
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var satresults = viewModel.SatScoresList.first(where: { satscore in
            satscore.dbn == viewModel.SchoolsList[indexPath.row].dbn
        })
        
        if let satresults = satresults{
            loadSchoolDetailsViewController(school:viewModel.SchoolsList[indexPath.row], satResults: satresults)
        }
        else{
            loadSchoolDetailsViewController(school:viewModel.SchoolsList[indexPath.row], satResults: SatScoresResponseModel())
        }
    }
    
    func loadSchoolDetailsViewController(school:SchoolsListResponseModel, satResults:SatScoresResponseModel) {
        self.coordinator?.loadSchoolDetailsViewController(school: school, satresults: satResults);
    }

}

//MARK: - Spinner
extension SchoolsListViewController: ActivityPresentable {}






