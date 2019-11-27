//
//  DetailedCoordinator.swift
//  Coordinator
//
//  Created by Niraj on 27/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import UIKit

class DetailedCoordinator: Coordinator {

    weak var parentCoordinator: PeriodicCoordinator?
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController

    var atomicElement: AtomicElement?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = DetailedViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
