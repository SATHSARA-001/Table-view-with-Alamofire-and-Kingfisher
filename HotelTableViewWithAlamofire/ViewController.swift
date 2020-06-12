import UIKit
import Alamofire
import Kingfisher
import AlamofireImage
import SDWebImage

class ViewController: UIViewController {
    
    var hotels: [hotel] = [] //Declaration Of Variable
    
    @IBOutlet weak var tblView: UITableView!{didSet{}} //Declaraton of Table View
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupUI()
        fetchData()
        
    }
    
    
    func setupUI()
    {
        tblView.delegate = self
        tblView.dataSource = self
        
    }
    
    
    func fetchData() {
        AF.request("https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json")
            .validate().responseDecodable(of: hotelData.self) {
                (response) in
                switch response.result {
                case .success:
                    guard let hotelsData = response.value else { return }
                    self.hotels = hotelsData.data ?? []
                    self.tblView.reloadData()
                case .failure (let err):
                    print(err)
                }
                
        }    }
    
    
    
    
    
    
}



extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell") as! TableViewCell
        cell.lbltitle.text = hotels[indexPath.row].title
        cell.lbldescription.text = hotels[indexPath.row].address
        if let url = URL(string: hotels[indexPath.row].image.small ?? "") {
            cell.img.kf.setImage(with: url, placeholder: UIImage())
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destVc = storyboard.instantiateViewController(identifier: "ViewDetailsPage") as! ViewDetails
        destVc.gotData = hotels[indexPath.row]
        self.navigationController?.pushViewController(destVc, animated: true)
        
        
    }
    
    
}






