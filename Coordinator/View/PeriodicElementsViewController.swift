//
//  BuyViewController.swift
//  Coordinator
//
//  Created by Niraj on 26/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import UIKit

class PeriodicElementsViewController: UITableViewController, Storyboarded {

    var coordinator: PeriodicCoordinator?
    var dataSource = TableDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let element: AtomicElement = dataSource.sendSingleDataElement(for: indexPath.row)
       coordinator?.presentDetails(of: element)
    }
}
