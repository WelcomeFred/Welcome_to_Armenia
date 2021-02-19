//
//  DescriptionVC.swift
//  welcome_tour
//
//  Created by Norayr Grigoryan on 2/19/21.
//

import UIKit

class DescriptionVC: UIViewController {

    var images:[UIImage] = [#imageLiteral(resourceName: "111"), #imageLiteral(resourceName: "777"), #imageLiteral(resourceName: "888"), #imageLiteral(resourceName: "333"), #imageLiteral(resourceName: "222")]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension DescriptionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carouselCollectionViewCell", for: indexPath) as! CarouselCollectionViewCell
        cell.myImageView.image = images[indexPath.row]
        return cell
    }
}
extension DescriptionVC: UICollectionViewDelegate {
    
}
