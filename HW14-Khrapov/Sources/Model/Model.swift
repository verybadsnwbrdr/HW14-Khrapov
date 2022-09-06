//
//  Model.swift
//  HW14-Khrapov
//
//  Created by Anton on 05.09.2022.
//

import Foundation

struct CellSources {
    var image: String
    var label: String
    var numberOfPhotos: Int
}

extension CellSources {
    static let cellSources = [
        [CellSources(image: "yana", label: "Недавние", numberOfPhotos: 1107)]
    ]
}
