//
//  ViewController.swift
//  WhiteHousePetititons
//
//  Created by TALHA AYAR on 17.08.2019.
//  Copyright © 2019 Talha Ayar. All rights reserved.
//

import UIKit

class RecentViewController: UITableViewController {
    
    var petitions = [Petition]()
    let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let petition = petitions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.item = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
}

}
