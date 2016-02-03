//
//  Channel.swift
//  Pods
//
//  Created by Cesar on 9/22/15.
//
//

import Foundation
import PromiseKit
import Socket_IO_Client_Swift

public protocol ChannelDelegate {

     typealias CallBackType
    
     func broadcast(name:String,var payload:[String:AnyObject],timeout:String)
     func listen(name:String, callback:CallBackType)->Promise<Any>
     func respond(messageDic:[String: AnyObject], callback:CallBackType)
     func fling(uuid:String)

}