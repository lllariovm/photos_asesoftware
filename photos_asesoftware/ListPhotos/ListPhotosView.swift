//
//  ListPhotosView.swift
//  photos_asesoftware
//
//  Created by Mario Valencia Morales on 14/02/24.
//

import Foundation
import UIKit

class ListPhotosView: UIViewController {
    private var photosTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PhotoCellView.self, forCellReuseIdentifier: "PhotoCellView")
        return tableView
    }()
    
    private let presenter: ListPhotosPresentable
    
    init(presenter: ListPhotosPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        setupTableView()
        presenter.onViewAppear()
    }
    
    private func setupTableView(){
        view.addSubview(photosTableView)
        
        NSLayoutConstraint.activate([
            photosTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photosTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photosTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            photosTableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        photosTableView.dataSource = self
    }
}

extension ListPhotosView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCellView", for: indexPath) as! PhotoCellView
        // cell.backgroundColor = .red
        let model = presenter.viewModels[indexPath.row]
        
        cell.configure(model: model)
        
        return cell
    }
}

extension ListPhotosView: ListPhotosUI {
    func update(photos: [ViewModel]) {
        print("Datos Recibidos: ")
        photos.forEach { photo in print(photo.title) }
        
        DispatchQueue.main.async {
            self.photosTableView.reloadData()
        }
    }
}
