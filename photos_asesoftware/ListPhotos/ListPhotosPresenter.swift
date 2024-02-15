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
    func onTapCell(atIndex: Int)
}

protocol ListPhotosUI: AnyObject {
    func update(photos: [ViewModel])
}

class ListPhotosPresenter: ListPhotosPresentable {
    weak var ui: ListPhotosUI?
    
    private let listPhotosInteractor: ListPhotosInteractable
    var viewModels: [ViewModel] = []
    private var models: [PhotoEntity] = []
    private let mapper: Mapper
    private let router: ListPhotosRouting
    
    init(listPhotosInteractor: ListPhotosInteractable, mapper: Mapper = Mapper(), router: ListPhotosRouting) {
        self.listPhotosInteractor = listPhotosInteractor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewAppear(){
        Task {
            models = await listPhotosInteractor.getListPhotos()
            viewModels = models.map(mapper.map(entity:))
            ui?.update(photos: viewModels)
        }
    }
    
    func onTapCell(atIndex: Int) {
        let photoId = models[atIndex].id
        router.showDetailPhoto(withPhotoId: photoId.description)
    }
}
