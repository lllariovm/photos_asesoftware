//
//  ListPhotosPresenter.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation

protocol ListPhotosUI: AnyObject {
    func update(photos: [PhotoEntity])
}

class ListPhotosPresenter {
    var ui: ListPhotosUI?
    
    private let listPhotosInteractor: ListPhotosInteractor
    
    init(listPhotosInteractor: ListPhotosInteractor) {
        self.listPhotosInteractor = listPhotosInteractor
    }
    
    func onViewAppear(){
        Task {
            let models = await listPhotosInteractor.getListPhotos()
            ui?.update(photos: models)
        }
    }
}
