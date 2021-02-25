//
//  Audio_TableViewController.swift
//  welcome_tour
//
//  Created by User on 20.02.21.
//

import UIKit

class Audio_TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleBlurEffect: UIVisualEffectView!
    
    var library = MusicLibrary().library
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.titleBlurEffect.alpha = 0.8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.tableView.reloadData()
    }
}


extension Audio_TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return library.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! Audio_TableViewCell
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.7
        cell.layer.masksToBounds = false
        cell.clipsToBounds = false
        cell.artistSong.text = library[indexPath.row]["artist"]!
        cell.titleSong.text = library[indexPath.row]["title"]!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPlayer", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlayer" {
            let playerVC = segue.destination as! Audio_ViewController
            let indexPath = tableView.indexPathForSelectedRow!
            playerVC.trackID = indexPath.row
        }
        
    }
}




