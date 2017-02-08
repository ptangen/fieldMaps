//
//  InfoView.swift
//  FieldMaps
//
//  Created by Paul Tangen on 2/8/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

import UIKit
import MapKit

class InfoView: UIView, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate {

    let infoTableViewInst = UITableView()
    let name = (label: "Name", value: "Anderson - New Home")
    let number = (label: "Number", value: "314")
    let location = (label: "Location" , value:"10 Slalom Drive, Grantham, NH")
    var projectDesc = [(label: String(), value: String())]
    var mapViewInst = MKMapView()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.infoTableViewInst.delegate = self
        self.infoTableViewInst.dataSource = self
        self.infoTableViewInst.register(InfoTableViewCell.self, forCellReuseIdentifier: "prototype")
        
        projectDesc = [self.name, self.number, self.location]
        self.pageLayout()
        
        self.mapViewInst.delegate = self
        let mapCenter = CLLocationCoordinate2D(latitude: 37.783333, longitude: -122.416667)
        let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: mapCenter, span: mapSpan)
        self.mapViewInst.setRegion(region, animated: false)
        self.addPin()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addPin() {
        let annotation = MKPointAnnotation()
        let locationCoordinate = CLLocationCoordinate2D(latitude: 37.779560, longitude: -122.393027)
        annotation.coordinate = locationCoordinate
        annotation.title = "Founders Den"
        self.mapViewInst.addAnnotation(annotation)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
            if let title = annotation.title! {
                print("Tapped \(title) pin")
            }
        }
    }
    
    func pageLayout() {
        // infoTableViewInst
        self.addSubview(self.infoTableViewInst)
        self.infoTableViewInst.translatesAutoresizingMaskIntoConstraints = false
        self.infoTableViewInst.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.infoTableViewInst.heightAnchor.constraint(equalToConstant: 208).isActive = true
        self.infoTableViewInst.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.infoTableViewInst.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        
        // mapViewInst
        self.addSubview(self.mapViewInst)
        self.mapViewInst.translatesAutoresizingMaskIntoConstraints = false
        self.mapViewInst.topAnchor.constraint(equalTo: self.infoTableViewInst.bottomAnchor, constant: 0).isActive = true
        self.mapViewInst.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.mapViewInst.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.mapViewInst.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.mapViewInst.backgroundColor = UIColor.green
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.projectDesc.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = InfoTableViewCell(style: .default, reuseIdentifier: "prototype")
        cell.selectionStyle = .none
        cell.labelLabel.text = self.projectDesc[indexPath.row].label
        cell.valueLabel.text = self.projectDesc[indexPath.row].value
        
        return cell
    }
}
