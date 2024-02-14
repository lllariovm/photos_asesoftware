//
//  PhotoCellView.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation
import UIKit
import Kingfisher

class PhotoCellView: UITableViewCell {
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let photoTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.font = .systemFont(ofSize: 17,
                                 weight: .bold,
                                 width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(photoImageView)
        addSubview(photoTitle)
        
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            photoImageView.heightAnchor.constraint(equalToConstant: 150),
            photoImageView.widthAnchor.constraint(equalToConstant: 100),
            photoImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -9),
            
            photoTitle.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 18),
            photoTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            photoTitle.topAnchor.constraint(equalTo: photoImageView.topAnchor, constant: 24),
        ])
    }
    
    func configure(model: ViewModel) {
        photoImageView.kf.setImage(with: URL(string: model.thumbnailUrl))
        photoTitle.text = model.title.capitalizedSentence
    }
}

extension String {
    var capitalizedSentence: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
}
