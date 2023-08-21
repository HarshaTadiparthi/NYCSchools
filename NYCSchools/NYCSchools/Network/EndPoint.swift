//
//  EndPoint.swift
//  NYCSchools
//
//  Created by Harshavardhan Tadiparthi on 18/08/23.
//

import Foundation

/// `EndPoint` defines base URL, all paths and queries.
enum EndPoint: Hashable {
    //Base url
    case baseURL
    //Schools List
    case schoolsList
    //SAT Scores
    case satScores
}

extension EndPoint {
    var rawValue: String {
        switch self {
        //Base url
        case .baseURL:
            return "https://data.cityofnewyork.us/"
        //Schools List
        case .schoolsList:
            return "resource/s3k6-pzi2.json"
        case .satScores:
            return "resource/f9bf-2cp4.json"

        }
    }
}

//https://data.cityofnewyork.us/resource/f9bf-2cp4.json

//https://data.cityofnewyork.us/resource/s3k6-pzi2.json
