//
//  ShipmentDetailScreenViewController.swift
//  NetLog
//
//  Created by ENES AKSOY on 20.02.2021.
//  Copyright © 2021 Enes Aksoy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ShipmentDetailScreenViewController: UIViewController {
    
    // MARK: - Proporties
    
    let locationManager = CLLocationManager()
    
    // MARK: - Outlets
    
    @IBOutlet weak var cameraImageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var cityAndCountryLabel: UILabel!
    @IBOutlet weak var subAdministrativeLabel: UILabel!
    @IBOutlet weak var streetNameLabel: UILabel!
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.mapView.showsUserLocation = true
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
        }
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        if let selectedImageData = ObjectStore.shared.selectImage {
            self.cameraImageView.image = UIImage(data: selectedImageData)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.bottomView.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
        
    }
    
    // MARK: - Actions
    
    @IBAction func openCameraButtonClicked(_ sender: Any) {
        let vc = CameraScreenViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func waybillButtonClick(_ sender: Any) {
        let vc = ZoomScreenViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - CLLocationManagerDelegate and MKMapViewDelegate

extension ShipmentDetailScreenViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate

        mapView.mapType = MKMapType.standard

        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        mapView.addAnnotation(annotation)

        let location = CLLocation(latitude: manager.location!.coordinate.latitude, longitude: manager.location!.coordinate.longitude)
        location.fetchCityAndCountry { city, country, subAdministrativeArea, streetName, error  in
            guard let city = city, let country = country, error == nil else { return }
            self.cityAndCountryLabel.text = "\(city)/\(country)"
            self.subAdministrativeLabel.text = subAdministrativeArea
            self.streetNameLabel.text = streetName
        }
    }
}

