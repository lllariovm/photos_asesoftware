//
//  DetailInteractor.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation

protocol DetailInteractable: AnyObject {
    func getDetailPhoto(withId id: String) async -> DetailPhotoEntity
}

class DetailInteractor: DetailInteractable {
    
    func getDetailPhoto(withId id: String) async -> DetailPhotoEntity {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos/\(id)")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsonDecoder.decode(DetailPhotoEntity.self, from: data)
    }
}
