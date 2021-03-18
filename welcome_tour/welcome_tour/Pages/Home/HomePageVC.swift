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
    var placeArr = DataModel()
    
    var coordinatesArray = [/*Akhtala*/[41.150790,44.764210], /*Amberd*/[40.388590,44.226601], /*Aragats*/[40.523152,44.195141], /*Ararat*/[39.678543,44.337262], /*Byurakan*/[40.331100,44.268554], /*Gandzasar*/[40.057309,46.530667], /*Garni*/[40.112329,44.730165], /*Geghard*/[40.140476,44.818420], /*Dadivank*/[40.141209,44.513472], /*Dvin*/[40.004696,44.578671], /*Zorats Karer*/[39.551666,46.028931], /*Zvartnoc*/[40.160296,44.336639], /*Ejmiacin*/[44.293564,40.163157], /*Lastiver*/[40.911464,45.104336], /*Khor Virap*/[39.878291,44.576363], /*Tsitsernakaberd*/[40.185773,44.490567], /*Kecharis*/[40.533793,44.716151], /*Haghartsin*/[40.801923,44.890636], /*Haghpat*/[41.0949637,44.7146364], /*Aybuben*/[40.408273,44.380720], /*Hankavan*/[40.635248, 44.485040], /*Ghazanchecoc*/[39.758762,46.747567], /*Marmashen*/[40.842837,43.755731], /*Marmarner*/[], /*Menq enq mer sarery*/[39.837268,46.770462], /*Noravank*/[39.684744,45.233010], /*Shaki*/[39.552334,45.993841], /*Jermuk*/[39.834751,45.682733], /*Saghmosavank*/[40.380514,44.396771], /*Sanahin*/[41.087146,44.666042], /*Sardarapat*/[40.093393,43.946185], /*Sevan*/[40.356503, 45.328307], /*Tatev*/[40.046528,49.016459], /*Symfonia*/[40.153716,44.675050], /*Odzun*/[41.050982,44.616199], /*Oshakan*/[40.258586,44.315658]]
    var descriptionsArray = ["a1","a2","a3","a4","a5","a6","a7","a8","a9","a10","a11","a12","a13","a14","a15","a16","a17","a18","a19","a20","a21","a22","a23","a24","a25","a26","a27","a28","a29","a30","a31","a32","a33","a34","a35","a36"]
    
    var placeArray = ["AkhtalaMonastery","Amberd", "AragatsMount", "AraratMount", "ByurakanObservatory", "Gandzasar", "TempleOfGarni", "Geghard", "Dadivank", "Dvin", "ZoratsKarer", "Zvartnots", "EtchmiadzinCathedral", "Lastiver", "KhorVirap", "Tsitsernakaberd", "Kecharis", "Haghartsin", "HaghpatMonastery", "ArmenianAlphabetMonument", "Hankavan", "Ghazanchetsots", "MarmashenMonastery", "Marmarner", "WeAreOurMountainsTheMonument", "Noravank", "ShakiWaterfall", "JermukWaterfall", "Saghmosavank", "SanahinMonastery","Sardarapat", "LakeSevan", "TatevMonastery", "SymphonyOfStones", "Odzun", "Oshakan" ]
    
    var regionArray = ["LoriRegion" /*Akhtala*/,"AragatsotnRegion"/*Amberd*/, "AragatsotnRegion"/*Aragats*/, "b"/*Ararat*/, "AragatsotnRegion"/*Byurakan*/, "Artsakh"/*Gandzasar*/, "KotaykRegion"/*Garni*/, "KotaykRegion"/*Geghard*/, "Artsakh"/*Dadivank*/, "AraratRegion"/*Dvin*/, "SyunikRegion"/*Zorats Karer*/,  "ArmavirRegion"/*Zvartnoc*/,  "ArmavirRegion"/*Ejmiacin*/, "TavushRegion"/*Lastiver*/, "AraratRegion"/*Khor Virap*/, "Yerevan"/*Tsitsernakaberd*/, "KotaykRegion"/*Kecharis*/, "TavushRegion"/*Haghartsin*/, "LoriRegion"/*Haghpat*/, "AragatsotnRegion"/*Aybuben*/, "KotaykRegion"/*Hankavan*/, "Artsakh"/*Ghazanchecoc*/, "ShirakRegion"/*Marmashen*/, "AraratRegion"/*Marmarner*/,  "Artsakh"/*Menq enq mer sarery*/,  "VayotsDzorRegion"/*Noravank*/, "SyunikRegion"/*Shaki*/, "VayotsDzorRegion"/*Jermuk*/, "AragatsotnRegion"/*Saghmosavank*/, "LoriRegion"/*Sanahin*/, "ArmavirRegion"/*Sardarapat*/, "GegharkunikRegion"/*Sevan*/, "SyunikRegion"/*Tatev*/, "KotaykRegion"/*Symfonia*/, "LoriRegion"/*Odzun*/, "AragatsotnRegion"/*Oshakan*/]
    
    var imagesArray = ["Ախթալայի վանք","Ամբերդ", "Արագած լեռ", "Արարատ լեռ", "Բյուրականի աստղադիտարան", "Գանձասար","Գառնու տաճար", "Գեղարդ", "Դադիվանք", "Դվին", "Զորաց Քարեր", "Զվարթնոց", "Էջմիածնի Մայր Տաճար", "Լաստիվեր","Խոր Վիրապ", "Ծիծեռնակաբերդ", "Կեչառիս", "Հաղարծին", "Հաղպատավանք", "Հայոց այբուբենի հուշարձան", "Հանքավան","Ղազանչեցոց եկեղեցի", "Մարմաշենի վանք", "Մարմարներ", "Մենք ենք մեր սարերը հուշարձան","Նորավանք", "Շաքիի ջրվեժ", "Ջերմուկի ջրվեժ", "Սաղմոսավանք", "Սանահինի վանք","Սարդարապատ","Սեւանա լիճ", "Տաթևի վանք", "Քարերի սիմֆոնիա","Օձուն", "Օշական"]
    
    var destinasionArray = ["3h 24min", // Akhtala
                            "1h 8min", // Amberd
                            "38min", // Aragats
                            "a", // Ararat
                            "40min", //Byurakan
                            "4h 26min", // Gandzasar
                            "41min", // Garni
                            "51min", // Geghard
                            "3h 17min", // Dadivank
                            "44min", //Dvin
                            "3h 27min", // Zorats Karer
                            "27min", // Zvartnots
                            "27min_", // Ejmiadzin
                            "2h 14min", // Lastiver
                            "40min_", // Khor Virap
                            "9min", // Tsitsernakaberd
                            "53min", // Kecharis
                            "1h 49min", // Haghartsin
                            "3h 28min", // Haghpat
                            "36min", // Armenian Alphabet Monument
                            "1h 15min", // Hankavan
                            "5h 22min", // GHazanchecoc
                            "2h 13min", // Marmashen
                            "38min_", // Marmarner
                            "5h 36min", // We are our mountains
                            "1h 55min", // Noravank
                            "3h 26min", // Shaki Waterfall
                            "2h 51min", // Jermuk Waterfall
                            "37min", // Saghmosavank
                            "3h 15min",// Sanahin
                            "52min", // Sardarapat
                            "1h 0min", // Lake Sevan
                            "4h 18min", // Tatev
                            "46min", // Kareri Simfonia
                            "3h 0min", // Odzun
                            "34min" // Oshakan
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
        
        return self.placeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.img.image = UIImage(named: imagesArray[indexPath.row])
        cell.placeLbl.text = LocalizableManager.getLocalizable(key: self.placeArray[indexPath.row])
        cell.regionLbl.text = LocalizableManager.getLocalizable(key: self.regionArray[indexPath.row])
        cell.distanceLblText.text = LocalizableManager.getLocalizable(key: "distanceText")
        cell.distanceLabel.text = LocalizableManager.getLocalizable(key:self.destinasionArray[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TABLE_VIEW_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SegmentedControlVC") as! SegmentedControlVC
        vc.place = LocalizableManager.getLocalizable(key: self.placeArray[indexPath.row])
        vc.placeArr = DataModel(placeImage: UIImage(named: imagesArray[indexPath.row]),
                                placeName: LocalizableManager.getLocalizable(key: self.placeArray[indexPath.row]),
                                placeRegion: LocalizableManager.getLocalizable(key: self.regionArray[indexPath.row]),
                                placeDistance: LocalizableManager.getLocalizable(key:self.destinasionArray[indexPath.row]),
                                placeDescription: LocalizableManager.getLocalizable(key:self.descriptionsArray[indexPath.row]),
                                placeLatitude: 44.5762299,
                                placeLongitude: 39.8783612)
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
