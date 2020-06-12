

import UIKit
import MapKit
import GooglePlaces
import GoogleMaps


class MapViewController: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    
    var mapData : hotel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMap()
        
        
    }
    
    
    func setMap()
    {
        let longitude =  Double(mapData.longitude ?? "0") ?? 0
        let latitude =  Double(mapData.latitude ?? "0") ?? 0
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.map = mapView
        
    }
    
    
}
