//
//  ListPhotosPresenter.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation

protocol ListPhotosPresentable: AnyObject {
    var ui: ListPhotosUI? { get }
    var viewModels: [ViewModel] { get }
    func onViewAppear()
}

protocol ListPhotosUI: AnyObject {
    func update(photos: [ViewModel])
}

class ListPhotosPresenter: ListPhotosPresentable {
    weak var ui: ListPhotosUI?
    
    private let listPhotosInteractor: ListPhotosInteractable
    var viewModels: [ViewModel] = []
    private let mapper: Mapper
    
    init(listPhotosInteractor: ListPhotosInteractable, mapper: Mapper = Mapper()) {
        self.listPhotosInteractor = listPhotosInteractor
        self.mapper = mapper
    }
    
    func onViewAppear(){
        Task {
            let models = await listPhotosInteractor.getListPhotos()
            viewModels = models.map(mapper.map(entity:))
            ui?.update(photos: viewModels)
        }
    }
}
