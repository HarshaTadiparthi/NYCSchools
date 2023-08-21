//
//  SatScoresResponseModel.swift
//  NYCSchools
//
//  Created by Harshavardhan Tadiparthi on 18/08/23.
//

import Foundation

struct SatScoresResponseModel: Codable {

  var dbn                        : String? = nil
  var schoolName                 : String? = nil
  var numOfSatTestTakers         : String? = nil
  var satCriticalReadingAvgScore : String? = nil
  var satMathAvgScore            : String? = nil
  var satWritingAvgScore         : String? = nil

  enum CodingKeys: String, CodingKey {

    case dbn                        = "dbn"
    case schoolName                 = "school_name"
    case numOfSatTestTakers         = "num_of_sat_test_takers"
    case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
    case satMathAvgScore            = "sat_math_avg_score"
    case satWritingAvgScore         = "sat_writing_avg_score"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    dbn                        = try values.decodeIfPresent(String.self , forKey: .dbn                        )
    schoolName                 = try values.decodeIfPresent(String.self , forKey: .schoolName                 )
    numOfSatTestTakers         = try values.decodeIfPresent(String.self , forKey: .numOfSatTestTakers         )
    satCriticalReadingAvgScore = try values.decodeIfPresent(String.self , forKey: .satCriticalReadingAvgScore )
    satMathAvgScore            = try values.decodeIfPresent(String.self , forKey: .satMathAvgScore            )
    satWritingAvgScore         = try values.decodeIfPresent(String.self , forKey: .satWritingAvgScore         )
 
  }

  init() {
  }

}

struct GetSatScoresRequest: APIRequest {
   var method: HTTPMethod = .GET
   var path: EndPoint = .satScores
   var parameters: [EndPoint : String] = [:]
   var body: [String : Any]? = nil
}
