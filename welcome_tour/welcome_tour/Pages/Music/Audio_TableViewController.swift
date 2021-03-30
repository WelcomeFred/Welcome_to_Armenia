//
//  Audio_TableViewController.swift
//  welcome_tour
//
//  Created by User on 20.02.21.
//

import UIKit

class Audio_TableViewController: UIViewController {

    let TABLE_VIEW_CELL_HEIGHT: CGFloat = 100

    @IBOutlet weak var tableView: UITableView!    
    var library = MusicLibrary().library
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.title = LocalizableManager.getLocalizable(key:"Music")
        navbarOptions()
        self.tableView.reloadData()
    }
}


extension Audio_TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return library.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return TABLE_VIEW_CELL_HEIGHT
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! Audio_TableViewCell
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




