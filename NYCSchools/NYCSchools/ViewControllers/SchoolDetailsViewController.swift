//
//  SchoolDetailsViewController.swift
//  NYCSchools
//
//  Created by Harshavardhan Tadiparthi on 18/08/23.
//

import UIKit

class SchoolDetailsViewController: UIViewController, Storyboarded {
    @IBOutlet weak var schoolNameLbl: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var sat1Label: UILabel!
    @IBOutlet weak var sat2Label: UILabel!
    @IBOutlet weak var sat3Label: UILabel!
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var sat4Label: UILabel!
    var viewModel : SchoolDetailsViewModel!
    @IBOutlet weak var emailLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set up the delgates & the dataSources of both the searchbar & searchResultsTableView
        self.UpdateUI()
    }
    
    private func UpdateUI()
    {
        schoolNameLbl.text = viewModel.selectedSchool.schoolName
        emailLabel.text = viewModel.selectedSchool.schoolEmail
        descLabel.text = viewModel.selectedSchool.overviewParagraph
        addressLabel.text = viewModel.selectedSchool.location
        self.sat1Label.text = AppStrings.NO_TEST_TAKERS + (viewModel.SelectedSchoolSatScores?.numOfSatTestTakers ?? AppStrings.NA)
        self.sat2Label.text = AppStrings.CRITICAL_READ_AVG_SCORE + (viewModel.SelectedSchoolSatScores?.satCriticalReadingAvgScore ?? AppStrings.NA)
        self.sat3Label.text = AppStrings.MATHS_AVG_SCORE + (viewModel.SelectedSchoolSatScores?.satMathAvgScore ?? AppStrings.NA)
        self.sat4Label.text = AppStrings.WRITING_AVG_SCORE  + (viewModel.SelectedSchoolSatScores?.satWritingAvgScore ?? AppStrings.NA)
    }
    
}

extension SchoolDetailsViewController: ActivityPresentable {}












