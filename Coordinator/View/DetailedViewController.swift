//
//  DetailedViewController.swift
//  Coordinator
//
//  Created by Niraj on 27/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController, Storyboarded {

    var coordinator: DetailedCoordinator?

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        testLabel.text = coordinator?.atomicElement?.name
        if let number = coordinator?.atomicElement?.number {
            numberLabel.text = String(number)
        }
        descriptionLabel.text = coordinator?.atomicElement?.summary

    }


}
