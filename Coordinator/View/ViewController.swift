//
//  ViewController.swift
//  Coordinator
//
//  Created by Niraj on 26/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBuy(_ sender: Any) {
        coordinator?.buySubscription()
    }

    @IBAction func friendZoneTapped(_ sender: Any) {
        coordinator?.friendZone()
    }
}

