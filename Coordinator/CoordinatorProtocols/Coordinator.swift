//
//  Coordinator.swift
//  Coordinator
//
//  Created by Niraj on 26/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()

}
