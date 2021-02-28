//
//  LanguageViewController.swift
//  welcome_tour
//
//  Created by User on 24.02.21.
//

import UIKit

class LanguageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var titleBlurEffect: UIVisualEffectView!
    @IBOutlet weak var titleName: UILabel!
    
    @IBOutlet weak var languageTB: UITableView!
    
    var languagesArrey = ["English (EN)", "Հայերեն (AM)", "Русский (RU)"]
    var languageFlags = ["englandFlag", "armeniaFlag", "russiaFlag" ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

      self.languageTB.delegate = self
      self.languageTB.dataSource = self
      self.titleBlurEffect.alpha = 0.8
        titleName.text = LocalizableManager.getLocalizable(key: "Language")
      if LocalizableManager.type == "hy" {
          titleName.font = titleName.font.withSize(27)
      }
      
    
    }
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
     return self.languagesArrey.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath) as? LanguageTableViewCell
     cell?.languageLbl.text = self.languagesArrey[indexPath.row]
        cell?.img.image = UIImage(named: languageFlags[indexPath.row])

        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    
            switch indexPath.row {
            case 0:
                LocalizableManager.type = "en"
                    dismiss(animated: true, completion: nil)
//                goToMorePage()
            case 1:
                LocalizableManager.type = "hy"
                    dismiss(animated: true, completion: nil)
//                goToMorePage()

            case 2:
                LocalizableManager.type = "ru"
                    dismiss(animated: true, completion: nil)
//                goToMorePage()

            default:
                break
            }
    }
    
//func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//
//     tableView.cellForRow(at: indexPath)?.accessoryType = .none
//
//    }
    @objc func goToMorePage() {
            
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoreVC") as? MoreVC
            
        self.present(vc!, animated: true, completion: nil)
    }
}
