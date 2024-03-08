//
//  MapView.swift
//  Recipes
//
//  Created by Carlos Alfredo Llerena Huayta on 16/05/23.
//

import UIKit
import MapKit
import RecipesUI

extension MapViewController {
    
    final class CustomView: UIView {

        let mapView: MKMapView = {
            let mapView = MKMapView()
            mapView.translatesAutoresizingMaskIntoConstraints = false
            return mapView
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            initializeView()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            initializeView()
        }
        
        private func initializeView() {
            backgroundColor = YPColors.viewBackground2
            addSubview(mapView)
            mapView.pinToSafeAreaSuperview()
        }
    }
}
