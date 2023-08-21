//
//  CoordinatorProtocol.swift
//  NYCSchools
//
//  Created by Harshavardhan Tadiparthi on 18/08/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
