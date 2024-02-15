//
//  DetailPresenter.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation

protocol DetailPresenterUI: AnyObject {
    func updateUI(viewModel: DetailPhotoViewModel)
}

protocol DetailPresentable: AnyObject {
    var ui: DetailPresenterUI? { get }
    var photoId: String { get }
    func onViewAppear()
}

class DatailPresenter: DetailPresentable {
    weak var ui: DetailPresenterUI?
    
    let photoId: String
    private let interactor: DetailInteractor
    private let mapper: MapperDetailPhotoViewModel
    
    init(photoId: String, interactor: DetailInteractor, mapper: MapperDetailPhotoViewModel) {
        self.photoId = photoId
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let model = await self.interactor.getDetailPhoto(withId: photoId)
            let viewModel = mapper.map(entity: model)
            
            await MainActor.run {
                self.ui?.updateUI(viewModel: viewModel)
                print(viewModel)
            }
        }
    }
}
