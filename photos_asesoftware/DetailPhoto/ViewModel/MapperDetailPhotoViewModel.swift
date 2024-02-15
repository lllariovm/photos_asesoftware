//
//  MapperDetailPhotoViewModel.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation

struct MapperDetailPhotoViewModel {
    func map(entity: DetailPhotoEntity) -> DetailPhotoViewModel{
        .init(id: entity.id,
            title: entity.title,
              url: entity.url
        )
    }
}
