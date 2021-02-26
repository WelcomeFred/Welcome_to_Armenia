//
//  HelpVC.swift
//  welcome_tour
//
//  Created by Norayr Grigoryan on 2/26/21.
//

import UIKit

class HelpVC: UIViewController {

    @IBOutlet weak var titleBlurEffect: UIVisualEffectView!
    @IBOutlet weak var titleName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
