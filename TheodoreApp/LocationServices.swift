import Foundation
import CoreLocation


class LocationServices:NSObject,CLLocationManagerDelegate{
    
    
    static let instance = LocationServices()
    
    var locationManager = CLLocationManager()
    
    var currentLocation:CLLocationCoordinate2D?
    
    
    override init() {
        super .init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = 50.0
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = locationManager.location?.coordinate
    }
    
    
    
}
