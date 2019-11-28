//
//  Int-TimeFormatter.swift
//  Coordinator
//
//  Created by Niraj on 28/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import Foundation

extension Int {
    func timeString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .positional

        let formattedString = formatter.string(from: TimeInterval(self)) ?? "0"
        return formattedString
    }
}
