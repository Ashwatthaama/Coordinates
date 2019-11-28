//
//  FriendZoneDataSource.swift
//  Coordinator
//
//  Created by Niraj on 28/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import UIKit

class FriendZoneDataSource: NSObject, UITableViewDataSource {

    var friends:[Friend] = [Friend]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.timeZone.identifier
        return cell
    }

    func saveData() {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()

        guard let saveData = try? encoder.encode(friends) else {
            fatalError("Cant save")
        }

        defaults.set(saveData, forKey: "Friends")
    }

    func loadData() {
        let defaults = UserDefaults.standard

        guard let savedData = defaults.data(forKey: "Friends") else {
            return
        }

        let decoder = JSONDecoder()

        guard let savedFriends = try? decoder.decode([Friend].self, from: savedData) else {
            return
        }
        friends = savedFriends
    }

}


struct Friend: Codable {
    var name: String = "New Friend"
    var timeZone: TimeZone = TimeZone.current
}
