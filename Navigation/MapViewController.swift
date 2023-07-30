
import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    private var characterArray = Array("abcdefghijklmnopqrstuvwxyz")
    private var sourse: CLLocationCoordinate2D?
    private var destination: CLLocationCoordinate2D?
    
    private lazy var routeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Маршрут a -> b", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(white: 0, alpha: 0.5)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(routeWay), for: .touchUpInside)
        return button
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Удалить все пины", for: .normal)
        button.backgroundColor = UIColor(white: 0, alpha: 0.5)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(deletePins), for: .touchUpInside)
        return button
    }()
    
    override func loadView() {
        super.loadView()
        checkUserLocationPermissions()
        setupMapView()
        configureMapView()
        centerViewOnUserLocation()
    }
    
    override func viewDidLoad() {
        let pressGesture = UITapGestureRecognizer(target: self, action: #selector(addPin(_:)))
        self.mapView.addGestureRecognizer(pressGesture)
    }
    
    private func setupMapView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        mapView.addSubview(deleteButton)
        mapView.addSubview(routeButton)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            deleteButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            deleteButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            deleteButton.bottomAnchor.constraint(equalTo: self.mapView.bottomAnchor, constant: -16),
            deleteButton.centerXAnchor.constraint(equalTo: self.mapView.centerXAnchor),
            
            routeButton.topAnchor.constraint(equalTo: self.mapView.topAnchor, constant: 10),
            routeButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            routeButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
            routeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
        ])
    }
    
    private func configureMapView() {
        mapView.mapType = .hybrid
        mapView.showsUserLocation = true
    }
    
    @objc private func routeWay() {

        if sourse != nil && destination != nil {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: sourse!))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination!))
            let directions = MKDirections(request: request)

            directions.calculate { [weak self] responce, error in
                guard let self = self else {
                    return
                }
                guard let responce = responce else {
                    if let error = error {
                        print("нет ответа")
                        print(error.localizedDescription)
                    }
                    return
                }
                if let route = responce.routes.first {
                    self.mapView.delegate = self
                    print("есть ответ по маршруту")
                    self.mapView.addOverlay(route.polyline)
                    let rect = route.polyline.boundingMapRect
                    self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
                }
            }
        } else {
            let alert = UIAlertController(title: "Нет точек", message: "Поставьте 2 точки на карте", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    @objc private func deletePins() {
        for annotation in self.mapView.annotations {
                self.mapView.removeAnnotation(annotation)
            }
        characterArray = Array("abcdefghijklmnopqrstuvwxyz")
        
    }
    
    @objc func addPin(_ sender: UITapGestureRecognizer? = nil) {
        let location = sender?.location(in: mapView) ?? CGPoint(x: 0, y: 0)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)

        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        // КРАШ
        annotation.title = String(characterArray.removeFirst())

        if annotation.title == Optional("a") {
            sourse = annotation.coordinate
        } else if annotation.title == "b" {
            destination = annotation.coordinate
        }
        mapView.addAnnotation(annotation)

    }

    private func checkUserLocationPermissions() {
        if #available(iOS 14.0, *) {
            switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .authorizedAlways, .authorizedWhenInUse:
                locationManager.delegate = self
                locationManager.requestLocation()
            case .denied, .restricted:
                break
                //allert
            @unknown default:
                fatalError("необрабатываемый статус")
            }
        } else {
            print("ошибка версии")
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.first as Any)
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 3000, longitudinalMeters: 3000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
        
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 3
        return renderer
    }
}
