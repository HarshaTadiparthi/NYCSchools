//
//  SchoolsListViewModel.swift
//  NYCSchools
//
//  Created by Harshavardhan Tadiparthi on 18/08/23.
//

import Foundation
import CoreLocation
import UIKit
class SchoolsListViewModel {
    private var apiManager: APIService!
    var userLocation: CLLocation?
    
    var SatScoresList = [SatScoresResponseModel]()
    var SchoolsList = [SchoolsListResponseModel]()

    var updateDataToView: (([SchoolsListResponseModel]?)-> Void)?
    var errorHandler : ((String) -> ()) = {error in }
    init(apiManager: APIService) {
        self.apiManager = apiManager
    }
}

//MARK: - Networking
extension SchoolsListViewModel
{
    func fetchSchoolsList(
                      completion:@escaping (Bool) -> Void) {
                
                        var combinedError: NetworkError?
                        let dispatchGroup = DispatchGroup()
                        dispatchGroup.enter()
                        let request1 = GetSchoolsRequest()
                        let request2 = GetSatScoresRequest()

                          apiManager.fetchData(with: request1) {[weak self] (response: [SchoolsListResponseModel]?, error: NetworkError?) in
                              defer { dispatchGroup.leave() }
                              if let response = response {
                                self?.SchoolsList = response
                                  self?.updateDataToView?(self?.SchoolsList)
                                  
                              } else if let error = error {
                                  print("Error occured on fetch data\(error.localizedDescription )")
                                  combinedError = error
                              }
                          }
        
                          dispatchGroup.enter()
                          apiManager.fetchData(with: request2) {[weak self] (response: [SatScoresResponseModel]?, error: NetworkError?) in
                              defer { dispatchGroup.leave() }
                              if let response = response {
                                  self?.SatScoresList = response
                              } else if let error = error {
                                  print("Error occured on fetch data\(error.localizedDescription )")
                                  combinedError = error
                              }
                          }
                          dispatchGroup.notify(queue: .main) {
                              if let error = combinedError {
                                  // Call the provided completion handler with the error
                                  self.errorHandler(error.description)
                              } else {
                                  // Both requests have completed, you can now combine the results
                                  // Call the provided completion handler with the combined data
                                  completion(false)
                              }
                          }
                          
                          completion(true)

        
    }
  
}
