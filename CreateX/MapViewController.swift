//
//  MapViewController.swift
//  CreateX
//
//  Created by Chris Truong on 11/19/18.
//  Copyright © 2018 Chris Truong. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: BaseViewController, CLLocationManagerDelegate, MKMapViewDelegate   {
    
    var data = [Violation]()
    var one: Violation = Violation()
    var two: Violation = Violation()
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var annotation = MKPointAnnotation()
    var annotation2 = MKPointAnnotation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSlideMenuButton()

        // Do any additional setup after loading the view.
        
        one.image = UIImage(named: "IMG_4231.png")
        one.video = "IMG_4146.mov"
        one.date = "11/12/2018"
        one.location = "190 5th St NW, Atlanta, GA 30332"
        one.time = "1:53 PM"
        
        
        two.image = UIImage(named: "IMG_4232.png")
        two.video = "IMG_4233.mov"
        two.date = "11/14/2018"
        two.location = "801 Atlantic Drive, Atlanta, GA 30332"
        two.time = "3:26 PM"
        
        data.append(one)
        data.append(two)
        
        let location = one.location
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location!) { [weak self] placemarks, error in
            if let placemark = placemarks?.first, let location = placemark.location {
                let mark = MKPlacemark(placemark: placemark)
                
                if var region = self?.mapView.region {
                    region.center = location.coordinate
                    region.span.longitudeDelta /= 8.0
                    region.span.latitudeDelta /= 8.0
                    self?.mapView.setRegion(region, animated: true)
                    self?.mapView.addAnnotation(mark)
                }
            }
        }
        
        let location2 = two.location
        let geocoder2 = CLGeocoder()
        geocoder2.geocodeAddressString(location2!) { [weak self] placemarks, error in
            if let placemark = placemarks?.first, let location2 = placemark.location {
                let mark = MKPlacemark(placemark: placemark)
                
                if var region = self?.mapView.region {
                    region.center = location2.coordinate
                    region.span.longitudeDelta /= 8.0
                    region.span.latitudeDelta /= 8.0
                    self?.mapView.setRegion(region, animated: true)
                    self?.mapView.addAnnotation(mark)
                }
            }
        }
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
        
        mapView.addAnnotation(annotation)
        mapView.addAnnotation(annotation2)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last as! CLLocation
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        var region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        region.center = mapView.userLocation.coordinate
        //mapView.setRegion(region, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
