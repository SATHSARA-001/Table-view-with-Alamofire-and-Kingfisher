

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func clickOnLogin(_ sender: UIButton) {
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil )
        let vc = sb.instantiateViewController(identifier: "ListPage") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
