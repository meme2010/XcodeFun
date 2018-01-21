//
//  ViewController.swift
//  JsonFun2
//
//  Created by Emerson Fonseca on 21/01/2018.
//  Copyright © 2018 Emerson Fonseca. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableVieuw: UITableView!
    var heros = [HeroStats]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dounloadJson {
            self.tableVieuw.reloadData()
        }
        
        tableVieuw.delegate = self
        tableVieuw.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = heros[indexPath.row].localized_name.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HeroViewController {
            destination.hero = heros[(tableVieuw.indexPathForSelectedRow?.row)!]
        }
    }
    
    func dounloadJson(completed: @escaping () -> () ) {
        
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.heros = try JSONDecoder().decode([HeroStats].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("JSON ERROR")
                }
            }
        }.resume()
    }


}

