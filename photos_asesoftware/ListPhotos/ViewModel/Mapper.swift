//
//  Mapper.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation

struct Mapper {
    func map(entity: PhotoEntity) -> ViewModel {
        ViewModel(id: entity.id,
                  title: entity.title,
                  thumbnailUrl: entity.thumbnailUrl
        )
    }
}
