

import UIKit
import MapKit
import CoreLocation


class ServiceViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate{
    
    // map develop
    var servecesOnMap = InformationServices()
    
    
    @IBOutlet weak var mapServices: MKMapView!
    
     var locationUser:DataMap?
  
    let zoomRadius:CLLocationDistance = 1000.0
    
    func centerMapOnLocation(location:CLLocation)
    {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, zoomRadius * 2 , zoomRadius * 2 )
        mapServices.setRegion(coordinateRegion, animated: true)
    }
   
    
    
    
    func checkLocationStatus()
    {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapServices.showsUserLocation = true
        
            LocationServices.instance.locationManager.delegate = self
            
            LocationServices.instance.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            LocationServices.instance.locationManager.startUpdatingLocation()
           
        }
            
        else{
            LocationServices.instance.locationManager.requestWhenInUseAuthorization()
        }
    }
   
    
    let washingService = DataMap(title: "Circles Center", locationName: "Repair Center. Work: 09:00 - 10:00", coordinate: CLLocationCoordinate2D(latitude: 53.90441401, longitude: 27.43466377)) //set coordinates on map
    
    
    let repairCar = DataMap(title: "Repair Car", locationName: "Repair Car Center. Work: 09:00 - 22:00", coordinate: CLLocationCoordinate2D(latitude: 53.90403476, longitude: 27.51937866)) //set coordinates on map
    
  let interiorClean = DataMap(title: "Cleaning Salon", locationName: "Cleaning. Work: 09:00 - 20:00 ", coordinate: CLLocationCoordinate2D(latitude: 53.95209559, longitude: 27.51534462)) //set coordinates on map
    
    let fuelStationFirst = DataMap(title: "Fuel Station", locationName: "Belneft station", coordinate: CLLocationCoordinate2D(latitude: 53.89392029, longitude: 27.52864838))

    let fuelStationSecond = DataMap(title: "Fuel Station", locationName: "A-100 station", coordinate: CLLocationCoordinate2D(latitude: 53.93830461, longitude: 27.58529663))
    
    
    let electroStation = DataMap(title: "Electro-Station", locationName: "Electro station.  Work: 09:00 - 20:00", coordinate: CLLocationCoordinate2D(latitude: 53.91889859, longitude: 27.63679504))
    
 let electroStationSecond = DataMap(title: "Electro-Station", locationName: "Electro station.  Work: 09:00 - 23:00", coordinate: CLLocationCoordinate2D(latitude: 53.86953434, longitude: 27.55233765))
    
    
    
    // table develop
    var namesServices = InformationServices()
    
    @IBOutlet weak var tableServices: UITableView!
    let indetifier:String = "Identifier"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: indetifier)
        
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: indetifier)
        }
        
    
        
        cell?.textLabel?.text = namesServices.nameServicesSections[indexPath.row]
        
        cell?.imageView?.image = UIImage(named: namesServices.namesOfImages[indexPath.row])
        
        
        
        
        return cell!
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesServices.nameServicesSections.count
    }
    

    // animations for cells
    
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.alpha = 0
    
            let transform = UIView.animate(withDuration: 1.0){
                cell.alpha = 1.0
    
            }
        }
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let find = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Find"){
            (action,indexPath) -> Void in
            
            let defaultText = " Just cheking in at " + self.servecesOnMap.nameServicesSections[indexPath.row]
           
            let activityStatus = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            
            
            
        }
        
        find.backgroundColor = UIColor(red:48.0 / 255.0,green:173.0 / 255.0,blue:99.0 / 255.0,alpha:0.75)
        
        return [find]
        
    }

    



    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapServices.delegate = self
        checkLocationStatus()
      
        
        mapServices.addAnnotations([repairCar,washingService,interiorClean,fuelStationFirst,fuelStationSecond,electroStation,electroStationSecond])
        
        centerMapOnLocation(location:CLLocation(latitude: 53.89857325, longitude: 27.56315231))
        
        
        
    }

    

 

}
