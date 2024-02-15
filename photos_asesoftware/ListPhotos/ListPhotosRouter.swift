//
//  ListPhotosRouter.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation
import UIKit

protocol ListPhotosRouting {
    var detailRouter: DetailRouting? { get }
    var listPhotoView: ListPhotosView? { get }
    
    func showListPhotos(window: UIWindow?)
    func showDetailPhoto(withPhotoId photoId: String)
}

class ListPhotosRouter: ListPhotosRouting {
    var detailRouter: DetailRouting?
    var listPhotoView: ListPhotosView?
    
    func showListPhotos(window: UIWindow?){
        self.detailRouter = DetailRouter()
        let interactor = ListPhotosInteractor()
        let presenter = ListPhotosPresenter(listPhotosInteractor: interactor, router: self)
        
        listPhotoView = ListPhotosView(presenter: presenter)
        presenter.ui = listPhotoView
        // view.presenter = presenter
        
        window?.rootViewController = listPhotoView
        window?.makeKeyAndVisible()
    }
    
    func showDetailPhoto(withPhotoId photoId: String) {
        guard let fromViewController = listPhotoView else {
            return
        }
        detailRouter?.showDetail(fromViewViewController: fromViewController, withPhotoId: photoId)
        
    }
}
