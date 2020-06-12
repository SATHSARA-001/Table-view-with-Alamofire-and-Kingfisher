

import UIKit
import Alamofire


class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtPwd: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func clickOnLogin(_ sender: UIButton) {
        
       sendData()
    }
    
    
       func sendData()
       {
           
           let params =  [
               "email": txtEmail.text!,
               "password": txtPwd.text!,
//               "password_confirmation": txtConfirmPassword.text!,
//               "first_name": txtFName.text!,
//               "device_id": UIDevice.current.identifierForVendor!.uuidString,
//               "device_type": "string"
           ]
           
           
           let urlString = "http://oxygen.sandbox15.preview.cx/api/v1/login"
           
           let headers : HTTPHeaders = [
            
               "Accept" : "application/json",
               "x-api-key" : "cXRZWOedaKl2QIdUsfAie4bW8jdFB3Fib1FE/dvznJM="
           ]
           
           AF.request(urlString, method: .post, parameters: params ,encoding: JSONEncoding.default, headers: headers).responseJSON {
               response in
               switch response.result {
               case .success:
                   print(response)
                print ("Sathsara")
                   
               case .failure(let error):
                   
                   print(error)
               }
           }
           
           
       }
    
    
    
}
