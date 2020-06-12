import UIKit
import MapKit

class Map: UIViewController {
    
    @IBOutlet private var mapView: MKMapView!
    var gotData : hotel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    private func setupUI(){
        //Add pin annotations to map
        let location = CLLocationCoordinate2D(latitude:Double(gotData.latitude ?? "0")!,longitude:Double(gotData.latitude ?? "0")!)
        let placeMark = MKPlacemark(coordinate: location, addressDictionary: nil)
        let annotation = MKPointAnnotation()
        annotation.title = self.gotData.title
        annotation.subtitle = self.gotData.address
        if let location = placeMark.location {
            annotation.coordinate = location.coordinate
            self.mapView.showAnnotations([annotation], animated: true)
        }
    }
    
    
    
}



private extension MKMapView {
    func centerToLocation(_ location: CLLocation,regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: regionRadius,longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

extension UIViewController: MKMapViewDelegate{
    
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //find annotation for identifier
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotation") as? MKPinAnnotationView
        //create annotation if not available
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
        } else {
            annotationView?.annotation = annotation
        }
        annotationView?.isEnabled = true
        annotationView?.canShowCallout = true
        return annotationView
    }
}

