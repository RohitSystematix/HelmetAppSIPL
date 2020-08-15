//
//  Extensions.swift
//  BLE_Demo
//
//  Created by Sandeep Mahajan on 15/07/20.
//  Copyright © 2020 IQVIS. All rights reserved.
//

import Foundation
import CoreBluetooth

typealias WriteCharacteristicType = UInt8

extension CBCharacteristic {
    
    func isWritable() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.write)) != []
    }
    
    func isReadable() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.read)) != []
    }
    
    func isWritableWithoutResponse() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.writeWithoutResponse)) != []
    }
    
    func isNotifable() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.notify)) != []
    }
    
    func isIdicatable() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.indicate)) != []
    }
    
    func isBroadcastable() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.broadcast)) != []
    }
    
    func isExtendedProperties() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.extendedProperties)) != []
    }
    
    func isAuthenticatedSignedWrites() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.authenticatedSignedWrites)) != []
    }
    
    func isNotifyEncryptionRequired() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.notifyEncryptionRequired)) != []
    }
    
    func isIndicateEncryptionRequired() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.indicateEncryptionRequired)) != []
    }
    
    
    func getPropertyContent() -> String {
        var propContent = ""
        if (self.properties.intersection(CBCharacteristicProperties.broadcast)) != [] {
            propContent += "Broadcast,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.read)) != [] {
            propContent += "Read,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.writeWithoutResponse)) != [] {
            propContent += "WriteWithoutResponse,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.write)) != [] {
            propContent += "Write,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.notify)) != [] {
            propContent += "Notify,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.indicate)) != [] {
            propContent += "Indicate,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.authenticatedSignedWrites)) != [] {
            propContent += "AuthenticatedSignedWrites,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.extendedProperties)) != [] {
            propContent += "ExtendedProperties,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.notifyEncryptionRequired)) != [] {
            propContent += "NotifyEncryptionRequired,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.indicateEncryptionRequired)) != [] {
            propContent += "IndicateEncryptionRequired,"
        }
        
        if !propContent.isEmpty {
            propContent = propContent.substring(to: propContent.endIndex)
        }
        
        return propContent
    }
}

extension NSData {
    func getByteArray() -> [UInt8]? {
        var byteArray: [UInt8] = [UInt8]()
        for i in 0..<self.length {
            var temp: UInt8 = 0
            self.getBytes(&temp, range: NSRange(location: i, length: 1))
            byteArray.append(temp)
        }
        return byteArray
    }
    
    var toWriteCharacteristicType: WriteCharacteristicType {
        withUnsafeBytes(of: WriteCharacteristicType.self) { $0.load(as: WriteCharacteristicType.self) }
    }
}
