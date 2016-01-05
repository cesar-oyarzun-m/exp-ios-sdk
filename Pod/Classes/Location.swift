//
//  Location.swift
//  Pods
//
//  Created by Cesar on 9/8/15.
//
//

import Foundation


public final class Location: Model,ResponseObject,ResponseCollection {

    public let uuid: String
    public var zones: [Zone] = []
    
    required public init?(response: NSHTTPURLResponse, representation: AnyObject) {
        if let representation = representation as? [String: AnyObject] {
            self.uuid = representation["uuid"] as! String
        } else {
            self.uuid = ""
        }
        
        if let zonesLocation = representation.valueForKeyPath("zones") as? [[String: AnyObject]] {
            self.zones = Zone.collection(response:response, representation: zonesLocation)
        }

        super.init(response: response, representation: representation)
    }
    
     public static func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [Location] {
        var locations: [Location] = []
        
        if let representation = representation as? [[String: AnyObject]] {
            for locationRepresentation in representation {
                if let location = Location(response: response, representation: locationRepresentation) {
                    locations.append(location)
                }
            }
        }
        return locations
    }
    
    public func getZones() -> [Zone]{
        return self.zones
    }
    
    public func getLayoutUrl() -> String {
        return hostUrl + "/api/locations/" + self.uuid + "/layout"
    }
}
