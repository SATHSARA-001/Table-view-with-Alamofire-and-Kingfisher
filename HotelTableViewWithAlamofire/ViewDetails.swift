

import UIKit

class ViewDetails: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnMap: UIBarButtonItem!
    @IBOutlet weak var btnGMap: UIBarButtonItem!
    
    var gotData : hotel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        imgView.layer.cornerRadius = imgView.frame.width/2
    }
    
    func setData()
    {
        lblAddress.text = gotData.address
        lblTitle.text = gotData.title
        let url = URL(string: gotData!.image.small!)!
        imgView.kf.setImage(with: url)
        
    }
    
    @IBAction func changeToMap(_ sender: UIButton){
        
        let mapSB = UIStoryboard.init(name: "Main", bundle: nil)
        let mapVC = mapSB.instantiateViewController(identifier: "MapPage") as! Map
        mapVC.gotData = gotData
        self.navigationController?.pushViewController(mapVC, animated: true)
        
    }
    

    
    @IBAction func chanageToGMap(_ sender: UIButton) {
    
        
        let mapSB = UIStoryboard.init(name: "Main", bundle: nil)
        let mapVC = mapSB.instantiateViewController(identifier: "GMap") as! MapViewController
        mapVC.mapData = gotData
        self.navigationController?.pushViewController(mapVC, animated: true)
    
    }
    
}
