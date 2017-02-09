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
    var selectedProject: Project?
    var mapViewInst = MKMapView()
    var projectDesc = [(label: String(), value: String())]
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.infoTableViewInst.delegate = self
        self.infoTableViewInst.dataSource = self
        self.infoTableViewInst.register(InfoTableViewCell.self, forCellReuseIdentifier: "prototype")
        
        self.mapViewInst.delegate = self
        self.pageLayout()
    }
    
    func drawMap(){
        self.getCoordinates(address: (self.selectedProject?.location)!, completion: { (lat, long) in
            if let unwrappedLat = lat, let unwrappedLong = long {
                DispatchQueue.main.async {
                    let mapCenter = CLLocationCoordinate2D(latitude: unwrappedLat, longitude: unwrappedLong)
                    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    let region = MKCoordinateRegion(center: mapCenter, span: mapSpan)
                    self.mapViewInst.setRegion(region, animated: false)
                    self.addPin(lat: unwrappedLat, long: unwrappedLong)
                }
            }
        })
    }
    
    func getTableViewData(){
        // use the project object to build an array for the tableview
        if let project = self.selectedProject {
            let name = (label: "Name", value: project.name)
            let number = (label: "Number", value: project.number)
            let location = (label: "Location" , value:project.location)
            self.projectDesc = [name, number, location]
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addPin(lat: Double, long: Double ) {
        let annotation = MKPointAnnotation()
        let locationCoordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        annotation.coordinate = locationCoordinate
        if let project = self.selectedProject {
            annotation.title = project.name
        }
        self.mapViewInst.addAnnotation(annotation)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
            if let title = annotation.title! {
                print("Tapped \(title) pin")
            }
        }
    }
    
    func getCoordinates(address:String, completion:@escaping (CLLocationDegrees?, CLLocationDegrees?)->Void) {
        APIClient.getLocationJSON(address: address) { (json) in
            guard let unwrappedJSON = json else { return }
            let results = unwrappedJSON["results"] as? [[String:Any]]
            guard let unwrappedResults = results else { return }
            
            for unwrappedDictionary in unwrappedResults {
                let geometry = unwrappedDictionary["geometry"] as? [String:Any]
                if let unwrappedGeometry = geometry {
                    let location = unwrappedGeometry["location"] as? [String:Any]
                    if let unwrappedLocation = location {
                        let lat = unwrappedLocation["lat"] as? CLLocationDegrees
                        let long = unwrappedLocation["lng"] as? CLLocationDegrees
                        completion(lat, long)
                    }
                }
            }
        }
    }
    
    func pageLayout() {
        // infoTableViewInst
        self.addSubview(self.infoTableViewInst)
        self.infoTableViewInst.translatesAutoresizingMaskIntoConstraints = false
        self.infoTableViewInst.topAnchor.constraint(equalTo: self.topAnchor, constant: 48).isActive = true
        self.infoTableViewInst.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.infoTableViewInst.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        let borderGray = UIColor(colorLiteralRed: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        self.infoTableViewInst.layer.borderWidth = 1.0;
        self.infoTableViewInst.layer.borderColor = borderGray.cgColor;
        
        // mapViewInst
        self.addSubview(self.mapViewInst)
        self.mapViewInst.translatesAutoresizingMaskIntoConstraints = false
        self.mapViewInst.topAnchor.constraint(equalTo: self.infoTableViewInst.bottomAnchor, constant: 0).isActive = true
        self.mapViewInst.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.mapViewInst.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.mapViewInst.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.projectDesc.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 56
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = InfoTableViewCell(style: .default, reuseIdentifier: "prototype")
        cell.selectionStyle = .none
        cell.labelLabel.text = self.projectDesc[indexPath.row].label
        cell.valueLabel.text = self.projectDesc[indexPath.row].value
        
        return cell
    }
}
