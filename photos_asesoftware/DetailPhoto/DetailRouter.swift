//
//  DetailRouter.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation
import UIKit

protocol DetailRouting: AnyObject {
    func showDetail(fromViewViewController: UIViewController, withPhotoId photoId: String)
}

class DetailRouter: DetailRouting {
    func showDetail(fromViewViewController: UIViewController, withPhotoId movieId: String) {
        let interactor = DetailInteractor()
        let presenter = DatailPresenter(photoId: movieId,
                                        interactor: interactor,
                                        mapper: MapperDetailPhotoViewModel()
        )
        
        let view = DetailView(presenter: presenter)
        presenter.ui = view
        
        fromViewViewController.present(view, animated: true)
    }
}
