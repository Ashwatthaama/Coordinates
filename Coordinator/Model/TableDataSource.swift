//
//  TableDataSource.swift
//  Coordinator
//
//  Created by Niraj on 27/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import Foundation
import UIKit

class TableDataSource: NSObject, UITableViewDataSource {

    var atomicElements = [AtomicElement]()

    override init() {
            guard let url = Bundle.main.url(forResource: "PeriodicTableJSON", withExtension: ".json") else {
                fatalError("JSON file not found")
            }

            guard let data = try? Data(contentsOf: url, options: []) else {
                fatalError("Could not load data from url")
            }

            let decorder = JSONDecoder()

            guard let json = try? decorder.decode([AtomicElement].self, from: data) else {
                fatalError("JSON Parsing Failed")
            }
            atomicElements = json
    }

    //------------------------------------------------------------------------------
    // MARK: - Tableview DataSource
    //------------------------------------------------------------------------------


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return atomicElements.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let atomicElement = atomicElements[indexPath.row]
        cell.textLabel?.text = atomicElement.name
        cell.detailTextLabel?.text = atomicElement.discovered_by
        return cell
    }

    func sendSingleDataElement(for index:Int) -> AtomicElement {
        return atomicElements[index]
    }

}
