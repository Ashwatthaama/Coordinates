//
//  FriendsDetailedCoordinator.swift
//  Coordinator
//
//  Created by Niraj on 28/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import UIKit

class FriendsDetailedCoordinator: Coordinator {

    weak var parentCoordinator: FriendZonedCoordinator?
    var childCoordinator: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController

    var friend: Friend!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let vc = FriendsDetailsViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }


}
