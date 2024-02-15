//
//  DetailView.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation
import UIKit
import Kingfisher

class DetailView: UIViewController {
    private let presenter: DetailPresentable
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let photoTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.font = .systemFont(ofSize: 20, weight: .bold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(presenter: DetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        presenter.onViewAppear()
    }
    
    func setupView() {
        view.addSubview(photoImageView)
        view.addSubview(photoTitle)
        
        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            photoImageView.heightAnchor.constraint(equalToConstant: 200),
            photoImageView.widthAnchor.constraint(equalToConstant: 300),
            
            photoTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            photoTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            photoTitle.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 100)
        ])
    }
}

extension DetailView: DetailPresenterUI {
    
    func updateUI(viewModel: DetailPhotoViewModel) {
        photoImageView.kf.setImage(with: URL(string: viewModel.url))
        photoTitle.text = viewModel.title.capitalizedSentence
    }
}
