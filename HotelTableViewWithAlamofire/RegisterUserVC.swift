import UIKit
import Alamofire

class RegisterUserVC: UIViewController {
    
    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didClickBtnRegister(_ sender: Any) {
        
        sendData()
    }
    
    
    
    func sendData()
    {
        
        let params =  [
            "email": txtEmail.text!,
            "password": txtPassword.text!,
            "password_confirmation": txtConfirmPassword.text!,
            "first_name": txtFName.text!,
            "device_id": UIDevice.current.identifierForVendor!.uuidString,
            "device_type": "string"
        ]
        
        
        let urlString = "http://oxygen.sandbox15.preview.cx/api/v1/register"
        
        let headers : HTTPHeaders = [
            "Accept" : "application/json",
            "x-api-key" : "cXRZWOedaKl2QIdUsfAie4bW8jdFB3Fib1FE/dvznJM="
        ]
        
        AF.request(urlString, method: .post, parameters: params ,encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                let sb = UIStoryboard.init(name: "Main", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "LoginPage") as! LoginViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
                
            case .failure(let error):
                
                print(error)
            }
        }
        
        
    }
    
    
    
}
