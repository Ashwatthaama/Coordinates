//
//  FriendZonedViewController.swift
//  Coordinator
//
//  Created by Niraj on 28/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import UIKit

class FriendZonedViewController: UITableViewController, Storyboarded {

    var coordinator: FriendZonedCoordinator?
    var dataSource = FriendZoneDataSource()

    var selectedFriend = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        title = "Friend Zone"

        dataSource.loadData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFriend))
    }


    @objc func addFriend() {
        let friend = Friend()
        dataSource.friends.append(friend)
        tableView.insertRows(at: [IndexPath(row: dataSource.friends.count - 1 , section: 0)], with: .automatic)
        selectedFriend = dataSource.friends.count - 1
        dataSource.saveData()
        coordinator?.showFriendDetails(friend)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFriend = indexPath.row
        coordinator?.showFriendDetails(dataSource.friends[indexPath.row])
    }

    func update(friend: Friend) {

        guard selectedFriend >= 0 else { return }

        tableView.reloadData()
        dataSource.friends[selectedFriend] = friend
        dataSource.saveData()

//        dataSource.friends[selectedFriend!] = friend
//        dataSource.saveData()
//        tableView.reloadData()
    }



}
