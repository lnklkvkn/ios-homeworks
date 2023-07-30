//
//  MapViewController.swift
//  Navigation
//
//  Created by ln on 20.06.2023.
//

import UIKit
import CoreLocation
import MapKit

final class MapViewController: UIViewController, CLLocationManagerDelegate {

    private lazy var mapView = MKMapView()
    private let locationManager =  CLLocationManager()
    
    override func loadView() {
        super.loadView()
        
        setupMapView()
    }
    
    private func setupMapView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
