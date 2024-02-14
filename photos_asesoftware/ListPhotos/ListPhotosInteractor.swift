//
//  ListPhotosInteractor.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation

protocol ListPhotosInteractable: AnyObject {
    func getListPhotos() async -> [PhotoEntity]
}

class ListPhotosInteractor: ListPhotosInteractable {
    
    func getListPhotos() async -> [PhotoEntity] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode([PhotoEntity].self, from: data)
    }
    
}

class ListPhotosInteractorMock: ListPhotosInteractable {
    
    func getListPhotos() async -> [PhotoEntity] {
        return [
            PhotoEntity(albumId: 2, id: 1, title: "asdfjl a ksdjk", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952"),
            PhotoEntity(albumId: 2, id: 2, title: "kj skj sdhj", url: "https://via.placeholder.com/600/771796", thumbnailUrl: "https://via.placeholder.com/150/771796"),
            PhotoEntity(albumId: 2, id: 3, title: "askdfj kjsd", url: "https://via.placeholder.com/600/24f355", thumbnailUrl: "https://via.placeholder.com/150/24f355"),
            PhotoEntity(albumId: 2, id: 4, title: "fasdk kjh", url: "https://via.placeholder.com/600/d32776", thumbnailUrl: "https://via.placeholder.com/150/d32776")
        ]
    }
}
