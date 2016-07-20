//
//  ViewController.swift
//  mapdemo
//
//  Created by Robert Snyder on 7/20/16.
//  Copyright © 2016 Robert Snyder. All rights reserved.
//

import UIKit
import MapKit
import CoreData

protocol MapViewControllerDelegate {
    func senderTag(tagNumber: Int)
}

class MapViewController: UIViewController, MKMapViewDelegate {
    
//    var window: UIWindow?
//    var locationManager: CLLocationManager?
    
    @IBOutlet weak var buttonChange: UIBarButtonItem!
    
    
    
    @IBOutlet var cafeMap: MKMapView!
    var localType: String = ""
    var cafeImage: UIImage?
    
    @IBAction func buttonLabel(sender: AnyObject) {
        
    }
    
    var tagNumber = 0
    var delegate: MapViewControllerDelegate?
    
    var natLanguage = ""
    
//    //permission to location
//    func application(application: UIApplication,
//                     didFinishLaunchingWithOptions
//        launchOptions: [NSObject: AnyObject]?) -> Bool {
//        
//        locationManager = CLLocationManager()
//        locationManager?.requestWhenInUseAuthorization()
//        
//        return true
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagNumber = Int(tagNumber)
        print(tagNumber)
        var iconThing = ""
        
        if tagNumber == 0 {
            natLanguage = "restaurant"
            buttonChange.title = "Find Eateries"
            iconThing = "barpin.png"
            
        } else if tagNumber == 1 {
            natLanguage = "Cafe"
            buttonChange.title = "Find Cafes"
            iconThing = "cafepin.png"
        } else if tagNumber == 2 {
            natLanguage = "hotel"
            buttonChange.title = "Find Hotels"
            iconThing = "hotelpin.png"
        } else if tagNumber == 3 {
            natLanguage = "park"
            buttonChange.title = "Find Parks"
            iconThing = "parkpin.png"
        }
        
//        cafeMap.showsUserLocation = true
        
        
        cafeMap.delegate = self
        let image = UIImage(named: iconThing)?.CGImage
        cafeImage = UIImage(CGImage: image!, scale: 10.0, orientation: UIImageOrientation(rawValue: 1)!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cafeButton(sender: UIBarButtonItem) {
        findCafe()
    }
    func findCafe() {
        
        
        print("gofind")
        let request = MKLocalSearchRequest()
        print(natLanguage)
        request.naturalLanguageQuery = natLanguage
        request.region = cafeMap.region
        
      
        print(cafeMap)
        print(cafeMap.region)
        
        
        let search = MKLocalSearch(request: request)
        search.startWithCompletionHandler({
            response, error in
            if error != nil {
                print(error)
            } else if let mapItems = response?.mapItems {
                print(response)
                print(mapItems)
                for item in mapItems {
                    self.placeItemOnMap(item)
                }
            }
        })
    }
//    
//    func zoomIn() {
//        let userLocation = cafeMap.userLocation
//        print(userLocation)
//        print(cafeMap.region)
//    
//        let region = MKCoordinateRegionMakeWithDistance(userLocation.location!.coordinate, 2000, 2000)
//        //let region = MKCoordinateRegionMakeWithDistance(userLocation.location!.coordinate, 2000, 2000)
//        
//        cafeMap.setRegion(region, animated: true)
//    }
    
//    func mapView(mapView: MKMapView, didUpdateUserLocation
//        userLocation: MKUserLocation) {
//        mapView.centerCoordinate = userLocation.location!.coordinate
//    }
    
    func placeItemOnMap (item: MKMapItem) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = item.placemark.coordinate
        annotation.title = item.name
        annotation.subtitle = item.phoneNumber
        cafeMap.addAnnotation(annotation)
    }
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let view = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        view.image = cafeImage
        view.canShowCallout = true
        return view
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        
        print(view.annotation!.title)
        
        
    }
    
    
    
    let ManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
//    @IBAction func addButton(sender: AnyObject) {
//        
//        
//        let someSortofEntity = NSEntityDescription.insertNewObjectForEntityForName("Recent", inManagedObjectContext: ManagedObjectContext) //NSManaged Object COntent is from line 15
//        
//        let randomString = someSortofEntity as! Recent
//        
//        
//        word =
//        
//        randomString.randomWord = String()
//        
//        
//        if ManagedObjectContext.hasChanges {
//            do {
//                try ManagedObjectContext.save()
//                
//                fetchingAll()
//                
//                
//            } catch {
//                print("Could Not Save")
//            }
//        }
//        
//        
//        
//    }
//
    
    
    
}

