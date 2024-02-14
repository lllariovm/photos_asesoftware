//
//  ListPhotosInteractor.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation

class ListPhotosInteractor {
    func getListPhotos() async -> [PhotoEntity] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode([PhotoEntity].self, from: data)
    }
}
