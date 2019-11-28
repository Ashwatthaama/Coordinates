//
//  FriendZonedCoordinator.swift
//  Coordinator
//
//  Created by Niraj on 28/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import UIKit

class FriendZonedCoordinator: Coordinator {


    weak var parentCoordinator: MainCoordinator?
    var childCoordinator: [Coordinator] = [Coordinator]()

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = FriendZonedViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func showFriendDetails(_ friend:Friend) {
        let child = FriendsDetailedCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        child.friend = friend
        childCoordinator.append(child)
        child.start()
    }

    func update(friend: Friend) {
        let vc = FriendZonedViewController()

        vc.update(friend: friend)
    }
}
