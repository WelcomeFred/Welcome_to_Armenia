//
//  HomePageVC.swift
//  welcome_tour
//
//  Created by User on 23.02.21.
//

import UIKit

class HomePageVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let TABLE_VIEW_CELL_HEIGHT: CGFloat = 170
    

    var imagesArray = ["Ախթալայի վանք","Ամբերդ", "Արագած լեռ", "Արարատ լեռ", "Բյուրականի աստղադիտարան", "Գանձասար","Գառնու տաճար", "Գեղարդ", "Դադիվանք", "Դվին", "Զորաց Քարեր", "Զվարթնոց", "Էջմիածնի Մայր Տաճար", "Լաստիվեր","Խոր Վիրապ", "Ծիծեռնակաբերդ", "Կեչառիս", "Հաղարծին", "Հաղպատավանք", "Հայոց այբուբենի հուշարձան", "Հանքավան","Ղազանչեցոց եկեղեցի", "Մարմաշենի վանք", "Մարմարներ", "Մենք ենք մեր սարերը հուշարձան","Նորավանք", "Շաքիի ջրվեժ", "Ջերմուկի ջրվեժ", "Սաղմոսավանք", "Սանահինի վանք","Սարդարապատ","Սեւանա լիճ", "Տաթևի վանք", "Քարերի սիմֆոնիա","Օձուն", "Օշական"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = LocalizableManager.getLocalizable(key: "Home")
        self.navigationController?.isNavigationBarHidden = true
        self.tableView.reloadData()
    }
    
    //    override var preferredStatusBarStyle: UIStatusBarStyle {
    //        self.navigationController?.isNavigationBarHidden = true
    //            return .default
    //    }
    
}

extension HomePageVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Places.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        // change code
        cell.img.image = UIImage(named: imagesArray[indexPath.row])
        
        cell.placeLbl.text = LocalizableManager.getLocalizable(key: Places(rawValue: indexPath.row)!.placeTitle)
        cell.regionLbl.text = LocalizableManager.getLocalizable(key: Places(rawValue: indexPath.row)!.region)
        if Places(rawValue: indexPath.row)!.length.isEmpty {
            cell.distanceLbl.text = ""
        } else {
            cell.distanceLbl.text = LocalizableManager.getLocalizable(key: "distance")
        }
        cell.lengthLbl.text = LocalizableManager.getLocalizable(key:Places(rawValue: indexPath.row)!.length)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TABLE_VIEW_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SegmentedControlVC") as! SegmentedControlVC

        vc.placeNavTitle = LocalizableManager.getLocalizable(key: Places(rawValue: indexPath.row)!.placeTitle)
        vc.descriptionText = LocalizableManager.getLocalizable(key: Places(rawValue: indexPath.row)!.description)
        vc.place = Places(rawValue: indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = .clear
    }
    
    // animation
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.7
        
        UIView.animate(withDuration: 0.8) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1
        }
    }
}
