//
//  LocationMapViewController.swift
//  Virtual Tourist
//
//  Created by Johnny Parham on 8/7/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class LocationMapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var deleteLabel: UILabel!
    @IBOutlet weak var editButton: UINavigationItem!
    
    var pins = [Pin]()
    var selectedPin: Pin? = nil
    
    // Flag for editing mode
    var editingPins = false
    
    // Core Data
    var sharedContext: NSManagedObjectContext {
        return CoreDataStackManager.sharedInstance().managedObjectContext
    }
    
    func fetchAllPins() -> [Pin] {
        
        // Create the fetch request
        let fetchRequest = NSFetchRequest(entityName: "Pin")
        
        // Execute the fetch request
        do {
            return try sharedContext.executeFetchRequest(fetchRequest)
                as! [Pin]
        } catch {
            print("error in fetch")
            return [Pin]()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(LocationMapViewController.handleLongPress(_:)))
        
        longPressRecognizer.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(longPressRecognizer)
        
        // Set the map view delegate
        mapView.delegate = self
        deleteLabel.hidden = true
        addSavedPinsToMap()
        
    }
    
    // Find all the saved pins and show it on the mapView
    func addSavedPinsToMap() {
        
        pins = fetchAllPins()
        print("Pin count in core data is \(pins.count)")
        
        for pin in pins {
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = pin.coordinate
            annotation.title = pin.pinTitle
            mapView.addAnnotation(annotation)
        }
    }
    
    // When the edit button is clicked, show the 'Done' button and flag the editingPins to true
    @IBAction func editClicked(sender: UIBarButtonItem) {
        
        if editingPins == false {
            editingPins = true
            deleteLabel.hidden = false
            navigationItem.rightBarButtonItem?.title = "Done"
        }
        
        else if editingPins {
            navigationItem.rightBarButtonItem?.title = "Edit"
            editingPins = false
            deleteLabel.hidden = true
        }
    }
    
    // Pressing and holding a point on the map creates a new Pin object and adds it to the map
    func handleLongPress(gestureRecognizer: UIGestureRecognizer) {
        
        // if it's in editing mode, do nothing
        if (editingPins) {
            return
        } else {
            if gestureRecognizer.state != .Began { return }
            
            let touchPoint = gestureRecognizer.locationInView(self.mapView)
            let touchMapCoordinate = mapView.convertPoint(touchPoint, toCoordinateFromView: mapView)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchMapCoordinate
            
            let newPin = Pin(lat: annotation.coordinate.latitude, long: annotation.coordinate.longitude, context: sharedContext)
            
            // Saving to core data
            CoreDataStackManager.sharedInstance().saveContext()
            
            // Adding the newPin to the pins array
            pins.append(newPin)
            
            // Downloading photos for the new pin (only download if it is a new pin)
            FlickrClient.sharedInstance().downloadPhotosForPin(newPin) {
                (success, error) in print("downloadPhotosForPin is success:\
                    (success) - error:\(error)") }
            // Find out the location name based on the coordinates
            let coordinates = CLLocation(latitude: annotation.coordinate.latitude, longitude: annotation.coordinate.longitude)
                
            let geoCoder = CLGeocoder()
                
                geoCoder.reverseGeocodeLocation(coordinates, completionHandler: { (placemark, error) -> Void in
                    if error != nil {
                        print("Error: \(error!.localizedDescription)")
                        return
                    }
                    if placemark!.count > 0 {
                        let pm = placemark![0] as CLPlacemark
                        if (pm.locality != nil) && (pm.country != nil) {
                            // Assigning the city and country to the annotation's title
                            annotation.title = "\(pm.locality!), \(pm.country!)"
                        }
                    } else {
                        print("Error with placemark")
                    }
                    })
            }
        }
        
        // Mark: - When a pin is tapped, it will transition to the Phone Album View Controller
        
        // Start by updated the view for the annotation.  This is necessary because it allows you to intercept taps on the annotation's view (the pin).
        func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
            let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            annotationView.canShowCallout = false
            
            return annotationView
        }
        
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        
        mapView.deselectAnnotation(view.annotation, animated: true)
        guard let annotation = view.annotation else { /* no annotation */ return }
        
        let title = annotation.title!
        print(annotation.title)
        
        selectedPin = nil
        
        for pin in pins {
            print("Deleting pin - verify core data is deleting as well")
            sharedContext.deleteObject(selectedPin!)
            
            // Deleting selected pin on map
            self.mapView.removeAnnotation(annotation)
            
            // Save the changes to core data
            CoreDataStackManager.sharedInstance().saveContext()
        } else {
            
            if title != nil {
                pin.pinTitle = title!
                
            } else {
                pin.pinTitle = "This pin has no name"
            }
            // Move to the Phone Album View Controller
            self.performSegueWithIdentifier("PhotAlbum", sender: nil)
        }
    }


    }



