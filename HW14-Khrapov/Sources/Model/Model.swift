//
//  Model.swift
//  HW14-Khrapov
//
//  Created by Anton on 05.09.2022.
//

import Foundation

struct CellSources {
    var headerRightButton: Bool?
    var image: String
    var label: String
    var numberOfPhotos: Int
}

extension CellSources {
    static let cellSources = [
        [
            CellSources(image: "yana", label: "Недавние", numberOfPhotos: 1107),
            CellSources(image: "like", label: "Избранное", numberOfPhotos: 46),
            CellSources(image: "inst", label: "Instagram", numberOfPhotos: 4),
            CellSources(image: "inst", label: "PicsArt", numberOfPhotos: 2),
            CellSources(image: "inst", label: "WhatsApp", numberOfPhotos: 35)
        ],
        [
            CellSources(image: "inst", label: "Люди", numberOfPhotos: 4),
            CellSources(image: "yana", label: "Места", numberOfPhotos: 650)
        ],
        [
            CellSources(image: "video", label: "Видео", numberOfPhotos: 46),
            CellSources(image: "person.crop.square", label: "Селфи", numberOfPhotos: 75),
            CellSources(image: "livephoto", label: "Фото Live Photos", numberOfPhotos: 43),
            CellSources(image: "cube", label: "Портреты", numberOfPhotos: 26),
            CellSources(image: "slowmo", label: "Замедленно", numberOfPhotos: 3),
            CellSources(image: "camera.viewfinder", label: "Снимки экрана", numberOfPhotos: 200),
            CellSources(image: "record.circle", label: "Записи экрана", numberOfPhotos: 3),
            CellSources(image: "r.square.on.square", label: "RAW", numberOfPhotos: 21)
        ],
        [
            CellSources(image: "square.and.arrow.down", label: "Импортированные", numberOfPhotos: 99),
            CellSources(image: "eye.slash", label: "Скрытые", numberOfPhotos: 6),
            CellSources(image: "trash", label: "Недавно удалённые", numberOfPhotos: 0)
        ]
    ]
}
