//: Playground - noun: a place where people can play

import UIKit
import MapKit

var str = "Hello, playground"

let coder = CLGeocoder()
var placemark : CLPlacemark?

coder.geocodeAddressString("Clementi Ave 3 Blk 462") { (placemarks, error) in
    if error != nil{
        print(error ?? "error")
    }
    if let ps = placemarks{
        placemark = ps.first
    }
}
placemark?.location?.coordinate