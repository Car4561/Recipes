//
//  MapViewController.swift
//  Recipes
//
//  Created by Carlos Llerena on 16/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    // MARK: Propierties
    
    var output: MapViewOutput!
    
    private var customView: CustomView {
        guard let view = view as? CustomView else {
            fatalError("Could not load Custom View")
        }
        return view
    }

    var mapView: MKMapView { customView.mapView }

    // MARK: Life cycle

    override func loadView() {
        view = CustomView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        configureMainNavigation()
        output.viewIsReady()
    }
    
    func configureMainNavigation() {
        title = CommonStrings.mapTitle
    }
}


// MARK: MapViewInput Methods

extension MapViewController: MapViewInput {

    func setUpInitialState() {
    }
    
    func setRecipe(recipe: Recipe) {
        let coordinate = CLLocationCoordinate2D(latitude: recipe.location.latitude, longitude: recipe.location.longitude)
        let annotation = MKPointAnnotation()
        annotation.title = recipe.name
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 500,
            longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }

    func moduleInput() -> MapModuleInput {
        return output as! MapModuleInput
    }
}

extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: .none)
        annotationView.pinTintColor = .red
        annotationView.canShowCallout = true
        annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        let placemark = MKPlacemark(coordinate: view.annotation!.coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.openInMaps(launchOptions: launchOptions)
    }
}
