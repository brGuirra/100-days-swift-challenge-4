//
//  ViewController.swift
//  challenge-4
//
//  Created by Bruno Guirra on 05/03/22.
//

import UIKit

class HomeViewController: UIViewController {
        
    @IBOutlet weak var table: UITableView!
    
    let data = [Sunset(name: "Sunset 1", picture: "sunset1"), Sunset(name: "Sunset 2", picture: "sunset2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
    }
}

struct Sunset {
    let name: String
    let picture: String
}

//MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sunset = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath) as! CustomTableViewCell
        
        cell.name.text = sunset.name
        cell.picture.image = UIImage(named: sunset.picture)
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
