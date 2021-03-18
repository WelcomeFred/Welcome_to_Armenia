//
//  MoreVC.swift
//  welcome_tour
//
//  Created by User on 24.02.21.
//

import UIKit

class MoreVC: UIViewController {
    
    @IBOutlet weak var more_tableView: UITableView!
    
    var nameSetings = ["Language", "Help", "AboutApp"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.more_tableView.delegate = self
        self.more_tableView.dataSource = self
        self.more_tableView.separatorStyle = .none
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        navbarOptions()
        self.title = LocalizableManager.getLocalizable(key: "More")
        self.more_tableView.reloadData()
    }
    
}

extension MoreVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return self.nameSetings.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoreTableViewCell
        
        cell.separatorInset = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsets.zero
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowColor = UIColor.blue.cgColor
        cell.layer.shadowRadius = 2
        cell.layer.shadowOpacity = 0.25
        cell.layer.masksToBounds = false;
        cell.clipsToBounds = false;
        cell.moreLbl.text = LocalizableManager.getLocalizable(key: self.nameSetings[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            self.performSegue(withIdentifier: "toLanguage", sender: nil)
        } else if indexPath.row == 1 {
            self.performSegue(withIdentifier: "help", sender: nil)
        }
        else if indexPath.row == 2 {
            self.performSegue(withIdentifier: "description", sender: nil)
        }
        
        
    }
    
}
