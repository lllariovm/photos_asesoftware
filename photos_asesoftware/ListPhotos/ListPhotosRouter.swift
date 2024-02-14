//
//  ListPhotosRouter.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation
import UIKit

class ListPhotosRouter {
    func showListPhotos(window: UIWindow?){
        let view = ListPhotosView()
        let interactor = ListPhotosInteractor()
        let presenter = ListPhotosPresenter(listPhotosInteractor: interactor)
        
        presenter.ui = view
        view.presenter = presenter
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
