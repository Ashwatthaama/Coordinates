//
//  AtomicElements.swift
//  Coordinator
//
//  Created by Niraj on 27/11/2019.
//  Copyright © 2019 Niraj. All rights reserved.
//

import Foundation
import UIKit

enum SysError: Error {
    case genericError
}


struct AtomicElement: Codable {

    var name: String?
    var appearance: String?
    var atomic_mass: Float?
    var boil: Float?
    var category: String?
    var color: String?
    var density: Float?
    var discovered_by: String?
    var melt: Float?
    var molar_heat: Float?
    var named_by: String?
    var number: Int?
    var period: Int?
    var phase: String?
    var source: String?
    var spectral_img: String?
    var summary: String?
    var symbol: String?
    var xpos: Int?
    var ypos: Int?
    var shells: [Int]?
    var electron_configuration: String?
    var electron_affinity: Float?
    var electronegativity_pauling: Float?
    let ionization_energies: [Float]?

}


