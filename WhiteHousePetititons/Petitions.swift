//
//  Petitions.swift
//  WhiteHousePetititons
//
//  Created by TALHA AYAR on 17.08.2019.
//  Copyright © 2019 Talha Ayar. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}

struct Petitions: Codable {
    var results: [Petition]
}
