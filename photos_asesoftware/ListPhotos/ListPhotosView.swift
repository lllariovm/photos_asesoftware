//
//  ListPhotosView.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation
import UIKit

class ListPhotosView: UIViewController {
    var presenter: ListPhotosPresenter?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        presenter?.onViewAppear()
    }
}

extension ListPhotosView: ListPhotosUI {
    func update(photos: [PhotoEntity]) {
        print("Datos Recibidos: ")
        photos.forEach { photo in print(photo.title) }
    }
}
