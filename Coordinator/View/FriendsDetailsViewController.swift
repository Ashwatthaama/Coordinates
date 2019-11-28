//
//  FriendsDetailsViewController.swift
//  Coordinator
//
//  Created by Niraj on 28/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import UIKit

class FriendsDetailsViewController: UITableViewController, Storyboarded {


    var timeZones: [TimeZone] = [TimeZone]()
    var selectedTimeZone = 0

    var namedEditingCell: FriendTableViewCell? {
        let indexPath = IndexPath(row: 0, section: 0)
        return tableView.cellForRow(at: indexPath) as? FriendTableViewCell
    }

    var coordinator: FriendsDetailedCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let identifiers = TimeZone.knownTimeZoneIdentifiers

        for identifier in identifiers {
            if let timezone = TimeZone(identifier: identifier) {
                timeZones.append(timezone)
            }
        }

        let now = Date()

        timeZones.sort {
            let ourTimeZone = $0.secondsFromGMT(for: now)
            let otherTimeZone = $1.secondsFromGMT(for: now)

            if ourTimeZone == otherTimeZone {
                return $0.identifier < $1.identifier
            } else {
                return ourTimeZone < otherTimeZone
            }
        }
        selectedTimeZone = timeZones.firstIndex(of: (coordinator?.friend.timeZone)!) ?? 0
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        coordinator?.parentCoordinator?.update(friend: coordinator!.friend)
    }

    func showTextField() {
        namedEditingCell?.friendTextField.becomeFirstResponder()
    }

    func selectRow(at indexPath:IndexPath) {
        namedEditingCell?.friendTextField.resignFirstResponder()

        for cell in tableView.visibleCells {
            cell.accessoryType = .none
        }

        selectedTimeZone = indexPath.row
        coordinator?.friend.timeZone = timeZones[indexPath.row]

        let selectedCell = tableView.cellForRow(at: indexPath)
        selectedCell?.accessoryType = .checkmark

        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    @IBAction func nameChanged(_ sender: UITextField) {
        coordinator?.friend.name = sender.text!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return timeZones.count
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Name of Friend"
        } else {
            return "Select their Timezone"
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            showTextField()
        } else {
            selectRow(at: indexPath)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Name", for: indexPath) as? FriendTableViewCell else {
                fatalError("Could not load cell")
            }

            cell.friendTextField.text = coordinator?.friend.name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimeZone", for: indexPath)
            let timeZone = timeZones[indexPath.row]
            cell.textLabel?.text = timeZone.identifier.replacingOccurrences(of: "_", with: " ")

            let timeDifference = timeZone.secondsFromGMT(for: Date())
            cell.detailTextLabel?.text = timeDifference.timeString()

            if indexPath.row == selectedTimeZone {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            return cell
        }
    }

}
