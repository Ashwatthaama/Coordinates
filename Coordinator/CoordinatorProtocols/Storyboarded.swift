//
//  Storyboarded.swift
//  Coordinator
//
//  Created by Niraj on 26/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyBoard.instantiateViewController(withIdentifier: id) as! Self
    }
}
