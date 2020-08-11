//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Luis Eduardo Madina Huerta on 6/19/20.
//  Copyright © 2020 Luis Eduardo Madina Huerta. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController{
    var mapView: MKMapView!
    var segmentedControl: UISegmentedControl!
    var labelSwitch: UILabel!
    var poiSwitch: UISwitch!
    
    var poiSwitchTopConstraint: NSLayoutConstraint!
    var poiSwitchCenterConstraint: NSLayoutConstraint!
    var poiLabelTopConstraint: NSLayoutConstraint!
    var poiLabelCenterConstraint: NSLayoutConstraint!
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
         segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        if #available(iOS 13.0, *) {
            segmentedControl.backgroundColor = UIColor.systemBackground
        } else {
            // Fallback on earlier versions
        }
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self,
                                   action: #selector(mapTypeChanged(_:)),
                                   for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints =  false
        view.addSubview(segmentedControl)
        
        let margins = view.layoutMarginsGuide
        let topContraint = segmentedControl.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8)
        let leadingConstraint  = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        
        topContraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        
        labelSwitch = UILabel()
        labelSwitch.text = "Points of Interest"
        labelSwitch.font = labelSwitch.font.withSize(20)
        labelSwitch.font = UIFont.systemFont(ofSize: 20, weight: .bold)


        labelSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelSwitch)
        
        
        poiSwitch = UISwitch()
        poiSwitch.addTarget(self, action: #selector(poiSwitchChange(_:)),
                            for:.valueChanged)
        poiSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(poiSwitch)
        
        poiSwitchTopConstraint = poiSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor,constant: 8)
        poiLabelCenterConstraint = labelSwitch.centerYAnchor.constraint(equalTo: poiSwitch.centerYAnchor)
        poiLabelTopConstraint = labelSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10)
        poiSwitchCenterConstraint = labelSwitch.centerYAnchor.constraint(equalTo: labelSwitch.centerYAnchor)
       updateVerticalPoiConstraint()
        
            let poiLabelLeadingConstraint = labelSwitch.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
            let poiSwitchLeadingConstraint = poiSwitch.leadingAnchor.constraint(equalTo: labelSwitch.trailingAnchor, constant: 30)
            poiLabelLeadingConstraint.isActive = true
            poiSwitchLeadingConstraint.isActive = true
    }
    
    
   @objc  func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
            labelSwitch.textColor = UIColor.black
        case 1:
            mapView.mapType = .hybrid
         labelSwitch.textColor = UIColor.white
        case 2:
            mapView.mapType = .satellite
            labelSwitch.textColor = UIColor.white
        default:
            break
        }
    }
    
    @objc func poiSwitchChange(_ poiSwitch: UISwitch){
        if poiSwitch.isOn{
            if #available(iOS 13.0, *) {
                mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
            } else {
                // Fallback on earlier versions
            }
            
            }

    else{
            if #available(iOS 13.0, *) {
                mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
            } else {
                // Fallback on earlier versions
            }
        }
      updateVerticalPoiConstraint()
    }
    
    func updateVerticalPoiConstraint(){
        // Compare the height of the switch to the height of the label. Position the taller one relative to the segmented control,
            // then center the smaller one on the larger.
        if labelSwitch.intrinsicContentSize.height < poiSwitch.intrinsicContentSize.height{
                poiSwitchTopConstraint.isActive = true
                poiLabelCenterConstraint.isActive = true
                poiLabelTopConstraint.isActive = false
                poiSwitchCenterConstraint.isActive = false
        }
            else{
                poiLabelTopConstraint.isActive = true
                poiSwitchCenterConstraint.isActive = true
                poiSwitchTopConstraint.isActive = false
                poiLabelCenterConstraint.isActive = false
            }
        }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Second View")
    }
    
}
