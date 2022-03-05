//
//  ViewController.swift
//  challenge-4
//
//  Created by Bruno Guirra on 05/03/22.
//

import UIKit

class HomeViewController: UIViewController {
        
    @IBOutlet weak var table: UITableView!
    
    var pictures = [Picture]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pictures"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        table.dataSource = self
        table.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pickPhoto))
    }
    
    @objc func pickPhoto() {
        let picker = UIImagePickerController()
        
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .camera
        
        present(picker, animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

//MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let picture = pictures[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath) as! CustomTableViewCell
        
        cell.name.text = picture.name
        cell.picture.image = UIImage(named: picture.image)
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

//MARK: - UIImagePickerControllerDelegate

extension HomeViewController: UIImagePickerControllerDelegate {
    
}

//MARK: - UINavigationControllerDelegate

extension HomeViewController: UINavigationControllerDelegate {
}
