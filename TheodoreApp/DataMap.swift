
import UIKit
import MapKit
import Contacts
import CoreLocation
import AddressBook
class DataMap: NSObject,MKAnnotation{
    
    
    // i should use these names, they requires!!!
    let title:String?
    let locationName:String?
    let coordinate:CLLocationCoordinate2D
    
    init(title:String,locationName:String,coordinate:CLLocationCoordinate2D)
    {
        
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
    }
    
    
       var subtitle:String? {
        return locationName
    }
    

    
    func mapItem(location:CLLocationCoordinate2D) -> MKMapItem{
        
        let addressDictionary = [String(CNPostalAddressStreetKey):subtitle]
        let placeMark = MKPlacemark(coordinate:location,addressDictionary:addressDictionary)
        
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.name = title
       
        return mapItem
        
        
    }
    
    
    
    

}
