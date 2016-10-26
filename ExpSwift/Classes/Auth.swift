//
//  Auth.swift
//  Pods
//
//  Created by Cesar on 12/28/15.
//
//

import Foundation
public final class Auth: Model,ResponseObject {
    
    required public init?(response: HTTPURLResponse, representation: Any) {
        let representation = representation as? [String: AnyObject] 
        super.init(response: response, representation: representation!)
    }
    
    
}
