//
//  SchoolDetailsViewModel.swift
//  NYCSchools
//
//  Created by Harshavardhan Tadiparthi on 18/08/23.
//

import Foundation
import CoreLocation
import UIKit
class SchoolDetailsViewModel {
    private var apiManager: APIService!
    public var selectedSchool:SchoolsListResponseModel!
    public var SelectedSchoolSatScores:SatScoresResponseModel?

    var updateSatScoresDataToView: ((SatScoresResponseModel?)-> Void)?
    var errorHandler : ((String) -> ()) = {error in }
    init(apiManager: APIService, SelectedSchool:SchoolsListResponseModel, SatResults:SatScoresResponseModel) {
        self.apiManager = apiManager
        self.selectedSchool = SelectedSchool
        self.SelectedSchoolSatScores = SatResults

    }
}

