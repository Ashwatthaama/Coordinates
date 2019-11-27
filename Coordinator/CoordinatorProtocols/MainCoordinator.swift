//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Niraj on 26/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {

    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    //------------------------------------------------------------------------------
    // MARK: - Coordinators
    //------------------------------------------------------------------------------

    func start() {
        navigationController.delegate = self
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func buySubscription() {
        let child = PeriodicCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinator.append(child)
        child.start()
    }

    //------------------------------------------------------------------------------
    // MARK: - Navigation Handler
    //------------------------------------------------------------------------------


    private func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinator.enumerated() {
            if coordinator === child {
                childCoordinator.remove(at: index)
                break
            }
        }
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: UITransitionContextViewControllerKey.from) else {
            return
        }

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        if let buyViewcController = fromViewController as? PeriodicElementsViewController {
            childDidFinish(buyViewcController.coordinator)
        }
    }

}
