//
//  BuyCoordinator.swift
//  Coordinator
//
//  Created by Niraj on 26/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import Foundation
import UIKit

class PeriodicCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {

    weak var parentCoordinator: MainCoordinator?
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
    self.navigationController = navigationController
    }

    //------------------------------------------------------------------------------
    // MARK: - Co-ordinators
    //------------------------------------------------------------------------------

    func start() {
    navigationController.delegate = self
    let vc = PeriodicElementsViewController.instantiate()
    vc.coordinator = self
    navigationController.pushViewController(vc, animated: true)
    }

    func presentDetails(of element:AtomicElement) {
        let child = DetailedCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        child.atomicElement = element
        childCoordinator.append(child)
        child.start()
    }

    fileprivate func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinator.enumerated() {
            if coordinator === child {
                childCoordinator.remove(at: index)
                break
            }
        }
    }

    //------------------------------------------------------------------------------
    // MARK: - Navigation Delegates
    //------------------------------------------------------------------------------


    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: UITransitionContextViewControllerKey.from) else {
            return
        }

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        if let buyViewcController = fromViewController as? DetailedViewController {
            childDidFinish(buyViewcController.coordinator)
        }
    }
}
