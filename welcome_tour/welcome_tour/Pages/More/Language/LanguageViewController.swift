//
//  LanguageViewController.swift
//  welcome_tour
//
//  Created by User on 24.02.21.
//

import UIKit

class LanguageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let TABLE_VIEW_CELL_HEIGHT: CGFloat = 60
    
    @IBOutlet weak var titleBlurEffect: UIVisualEffectView!
    @IBOutlet weak var titleName: UILabel!
    
    @IBOutlet weak var languageTB: UITableView!
    
    var languagesArrey = ["English (EN)", "Հայերեն (AM)", "Русский (RU)"]
    var languageFlags = ["englandFlag", "armeniaFlag", "russiaFlag" ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.languageTB.delegate = self
        self.languageTB.dataSource = self
        self.titleBlurEffect.alpha = 0.8
        titleName.text = LocalizableManager.getLocalizable(key: "Language")
        if LocalizableManager.type == "hy" {
            titleName.font = titleName.font.withSize(27)
        }
        languageTB.tableFooterView = UIView()
        self.title = LocalizableManager.getLocalizable(key: "Language")
    }
    override func viewDidAppear(_ animated: Bool) {
        languageTB.frame = CGRect(x: languageTB.frame.origin.x, y: languageTB.frame.origin.y, width: languageTB.frame.size.width, height: languageTB.contentSize.height)
    }
    override func viewDidLayoutSubviews(){
        languageTB.frame = CGRect(x: languageTB.frame.origin.x, y: languageTB.frame.origin.y, width: languageTB.frame.size.width, height: languageTB.contentSize.height)
        languageTB.reloadData()
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
        return TABLE_VIEW_CELL_HEIGHT
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath) as? LanguageTableViewCell
        cell?.languageLbl.text = self.languagesArrey[indexPath.row]
        cell?.img.image = UIImage(named: languageFlags[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            LocalizableManager.type = "en"
        case 1:
            LocalizableManager.type = "hy"
        case 2:
            LocalizableManager.type = "ru"
        default:
            break
        }
        UserDefaults.standard.set(LocalizableManager.type, forKey: systemLanguage)
        navigationController?.popViewController(animated: true)
        NotificationCenter.default.post(name: .language, object: nil)
        }
    }
