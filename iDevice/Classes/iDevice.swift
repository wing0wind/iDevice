//
//  iDevice.swift
//  ReduxFramework
//
//  Created by wing0wind@gmail.com on 04/02/2018.
//  Copyright (c) 2018 wing0wind@gmail.com. All rights reserved.
//

public class iDevice: NSObject {
    
    public struct DeviceInfo {
        public var machineName: MachineName
        public var deviceMonitorType: DeviceMonitorType
        init(machine: String) {
            if let deviceType = MachineName(rawValue: machine) {
                machineName = deviceType
            } else {
                machineName = .unKnown
            }
            deviceMonitorType = .unKnown
        }
    }
    
    private(set) static var deviceInfo: DeviceInfo? = nil
    /**
     Get the running device's type
     */
    public class func deviceType() -> DeviceType {
        var size: Int = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        
        let deviceName = String( cString: machine)
        if let deviceType = DeviceType(rawValue: deviceName) {
            return deviceType
        } else {
            return .unKnown
        }
    }
    
    public class func info() -> DeviceInfo {
        if let deviceInfo = deviceInfo {
           return deviceInfo
        } else {
            deviceInfo = DeviceInfo.init(machine: getMachineName())
            return deviceInfo!
        }
        
    }
    
    private class func getMachineName() -> String {
        var size: Int = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String( cString: machine)
    }
}

/**
 Monitor Type
 */
public enum DeviceMonitorType {
    case unKnown
    case iPhone4
    case iPhone5
    case iPhone6
    case iPhone6Plus
    case iPhoneSE
    case iPhoneX
    case iPad
    case iPadMini
    case iPadPro
    case iPodTouch
    case iPodTouchLarge
}

public enum MachineName: String {
    case unKnown    = ""
    // iPhone
    case iPhone4_1  = "iPhone4,1"
    case iPhone5_1  = "iPhone5,1"
    case iPhone5_2  = "iPhone5,2"
    case iPhone5_3  = "iPhone5,3"
    case iPhone5_4  = "iPhone5,4"
    case iPhone6_1  = "iPhone6,1"
    case iPhone6_2  = "iPhone6,2"
    case iPhone7_1  = "iPhone7,1"
    case iPhone7_2  = "iPhone7,2"
    case iPhone8_1  = "iPhone8,1"
    case iPhone8_2  = "iPhone8,2"
    case iPhone8_4  = "iPhone8,4"
    case iPhone9_1  = "iPhone9,1"
    case iPhone9_2  = "iPhone9,2"
    case iPhone9_3  = "iPhone9,3"
    case iPhone9_4  = "iPhone9,4"
    case iPhone10_1 = "iPhone10,1"
    case iPhone10_2 = "iPhone10,2"
    case iPhone10_3 = "iPhone10,3"
    case iPhone10_4 = "iPhone10,4"
    case iPhone10_5 = "iPhone10,5"
    case iPhone10_6 = "iPhone10,6"
    // iPad
    case iPad1_1    = "iPad1,1"
    case iPad2_1    = "iPad2,1"
    case iPad2_2    = "iPad2,2"
    case iPad2_3    = "iPad2,3"
    case iPad2_4    = "iPad2,4"
    case iPad2_5    = "iPad2,5"
    case iPad2_6    = "iPad2,6"
    case iPad2_7    = "iPad2,7"
    case iPad3_1    = "iPad3,1"
    case iPad3_2    = "iPad3,2"
    case iPad3_3    = "iPad3,3"
    case iPad3_4    = "iPad3,4"
    case iPad3_5    = "iPad3,5"
    case iPad3_6    = "iPad3,6"
    case iPad4_1    = "iPad4,1"
    case iPad4_2    = "iPad4,2"
    case iPad4_3    = "iPad4,3"
    case iPad4_4    = "iPad4,4"
    case iPad4_5    = "iPad4,5"
    case iPad4_6    = "iPad4,6"
    case iPad4_7    = "iPad4,7"
    case iPad4_8    = "iPad4,8"
    case iPad4_9    = "iPad4,9"
    case iPad5_1    = "iPad5,1"
    case iPad5_2    = "iPad5,2"
    case iPad5_3    = "iPad5,3"
    case iPad5_4    = "iPad5,4"
    case iPad6_3    = "iPad6,3"
    case iPad6_4    = "iPad6,4"
    case iPad6_7    = "iPad6,7"
    case iPad6_8    = "iPad6,8"
    case iPad6_11   = "iPad6,11"
    case iPad6_12   = "iPad6,12"
    case iPad7_1    = "iPad7,1"
    case iPad7_2    = "iPad7,2"
    case iPad7_3    = "iPad7,3"
    case iPad7_4    = "iPad7,4"
    // iPod
    case iPod1_1    = "iPod1,1"
    case iPod2_1    = "iPod2,1"
    case iPod3_1    = "iPod3,1"
    case iPod4_1    = "iPod4,1"
    case iPod5_1    = "iPod5,1"
    case iPod7_1    = "iPod7,1"
    
    // Other
    case AudioAccessory1_1 = "AudioAccessory1,1"
    
    // Simulator
    case i386       = "i386"
    case x86_64     = "x86_64"
}
    
/**
 Device Type
 */
public enum DeviceType: String {
    case unKnown    = ""
    case iPhone4_1  = "iPhone4,1"
    case iPhone5_1  = "iPhone5,1"
    case iPhone5_2  = "iPhone5,2"
    case iPhone5_3  = "iPhone5,3"
    case iPhone5_4  = "iPhone5,4"
    case iPhone6_1  = "iPhone6,1"
    case iPhone6_2  = "iPhone6,2"
    case iPhone7_1  = "iPhone7,1"
    case iPhone7_2  = "iPhone7,2"
    case iPhone8_1  = "iPhone8,1"
    case iPhone8_2  = "iPhone8,2"
    case iPhone8_4  = "iPhone8,4"
    case iPhone9_1  = "iPhone9,1"
    case iPhone9_2  = "iPhone9,2"
    case iPhone9_3  = "iPhone9,3"
    case iPhone9_4  = "iPhone9,4"
    case iPhone10_1 = "iPhone10,1"
    case iPhone10_2 = "iPhone10,2"
    case iPhone10_3 = "iPhone10,3"
    case iPhone10_4 = "iPhone10,4"
    case iPhone10_5 = "iPhone10,5"
    case iPhone10_6 = "iPhone10,6"
    case iPad1_1    = "iPad1,1"
    case iPad2_1    = "iPad2,1"
    case iPad2_2    = "iPad2,2"
    case iPad2_3    = "iPad2,3"
    case iPad2_4    = "iPad2,4"
    case iPad2_5    = "iPad2,5"
    case iPad2_6    = "iPad2,6"
    case iPad2_7    = "iPad2,7"
    case iPad3_1    = "iPad3,1"
    case iPad3_2    = "iPad3,2"
    case iPad3_3    = "iPad3,3"
    case iPad3_4    = "iPad3,4"
    case iPad3_5    = "iPad3,5"
    case iPad3_6    = "iPad3,6"
    case iPad4_1    = "iPad4,1"
    case iPad4_2    = "iPad4,2"
    case iPad4_3    = "iPad4,3"
    case iPad4_4    = "iPad4,4"
    case iPad4_5    = "iPad4,5"
    case iPad4_6    = "iPad4,6"
    case iPad4_7    = "iPad4,7"
    case iPad4_8    = "iPad4,8"
    case iPad4_9    = "iPad4,9"
    case iPad5_3    = "iPad5,3"
    case iPad5_4    = "iPad5,4"
    case iPad6_8    = "iPad6,8"
    case iPod1_1    = "iPod1,1"
    case iPod2_1    = "iPod2,1"
    case iPod3_1    = "iPod3,1"
    case iPod4_1    = "iPod4,1"
    case iPod5_1    = "iPod5,1"
    case iPod7_1    = "iPod7,1"
    
    /**
     Device Type name
     */
    public func name() -> String {
        switch self {
        case .unKnown: return ""
        case .iPhone4_1: return "iPhone 4S"
        case .iPhone5_1: return "iPhone 5 (A1428)"
        case .iPhone5_2: return "iPhone 5 (A1429)"
        case .iPhone5_3: return "iPhone 5c (A1456/A1532)"
        case .iPhone5_4: return "iPhone 5c (A1507/A1516/A1529)"
        case .iPhone6_1: return "iPhone 5s (A1433/A1453)"
        case .iPhone6_2: return "iPhone 5s (A1457/A1518/A1530)"
        case .iPhone7_1: return "iPhone 6 Plus"
        case .iPhone7_2: return "iPhone 6"
        case .iPhone8_1: return "iPhone 6S"
        case .iPhone8_2: return "iPhone 6S Plus"
        case .iPhone8_4: return "iPhone SE"
        case .iPhone9_1: return "iPhone 7"
        case .iPhone9_2: return "iPhone 7 Plus"
        case .iPhone9_3: return "iPhone 7"
        case .iPhone9_4: return "iPhone 7 Plus"
        case .iPhone10_1, .iPhone10_4: return "iPhone 8"
        case .iPhone10_2, .iPhone10_5: return "iPhone 8 Plus"
        case .iPhone10_3, .iPhone10_6: return "iPhone X"
        case .iPad1_1: return "iPad"
        case .iPad2_1: return "iPad 2 (Wi-Fi)"
        case .iPad2_2: return "iPad 2 (GSM)"
        case .iPad2_3: return "iPad 2 (CDMA)"
        case .iPad2_4: return "iPad 2 (Wi-Fi, revised)"
        case .iPad2_5: return "iPad mini (Wi-Fi)"
        case .iPad2_6: return "iPad mini (A1454)"
        case .iPad2_7: return "iPad mini (A1455)"
        case .iPad3_1: return "iPad (3rd gen, Wi-Fi)"
        case .iPad3_2: return "iPad (3rd gen, Wi-Fi+LTE Verizon)"
        case .iPad3_3: return "iPad (3rd gen, Wi-Fi+LTE AT&T)"
        case .iPad3_4: return "iPad (4th gen, Wi-Fi)"
        case .iPad3_5: return "iPad (4th gen, A1459)"
        case .iPad3_6: return "iPad (4th gen, A1460)"
        case .iPad4_1: return "iPad Air (Wi-Fi)"
        case .iPad4_2: return "iPad Air (Wi-Fi+LTE)"
        case .iPad4_3: return "iPad Air (Rev)"
        case .iPad4_4: return "iPad mini 2 (Wi-Fi)"
        case .iPad4_5: return "iPad mini 2 (Wi-Fi+LTE)"
        case .iPad4_6: return "iPad mini 2 (Rev)"
        case .iPad4_7: return "iPad mini 3 (Wi-Fi)"
        case .iPad4_8: return "iPad mini 3 (A1600)"
        case .iPad4_9: return "iPad mini 3 (A1601)"
        case .iPad5_3: return "iPad Air 2 (Wi-Fi)"
        case .iPad5_4: return "iPad Air 2 (Wi-Fi+LTE)"
        case .iPad6_8: return "iPad Pro"
        case .iPod1_1: return "iPod touch"
        case .iPod2_1: return "iPod touch (2nd gen)"
        case .iPod3_1: return "iPod touch (3rd gen)"
        case .iPod4_1: return "iPod touch (4th gen)"
        case .iPod5_1: return "iPod touch (5th gen)"
        case .iPod7_1: return "iPod touch (6th gen)"
        }
    }
    
    /**
     Monitor Size Inch
     */
    public func monitorSizeInch() -> Double {
        switch self {
        case .unKnown:
            return 0.0
        case .iPhone4_1, .iPod1_1, .iPod2_1, .iPod3_1, .iPod4_1:
            return 3.5
        case .iPhone5_1, .iPhone5_2, .iPhone5_3, .iPhone5_4, .iPhone6_1, .iPhone8_4, .iPhone6_2, .iPod5_1, .iPod7_1:
            return 4.0
        case .iPhone7_2, .iPhone8_1, .iPhone9_1, .iPhone9_3, .iPhone10_1, .iPhone10_4:
            return 4.7
        case .iPhone7_1, .iPhone8_2, .iPhone9_2, .iPhone9_4, .iPhone10_2, .iPhone10_5:
            return 5.5
        case .iPhone10_3, .iPhone10_6:
            return 5.8
        case .iPad1_1, .iPad2_1, .iPad2_2, .iPad2_3, .iPad2_4, .iPad3_1, .iPad3_2, .iPad3_3, .iPad3_4, .iPad3_5, .iPad3_6, .iPad4_1, .iPad4_2, .iPad4_3, .iPad5_3, .iPad5_4:
            return 9.7
        case .iPad2_5, .iPad2_6, .iPad2_7, .iPad4_4, .iPad4_5, .iPad4_6, .iPad4_7, .iPad4_8, .iPad4_9:
            return 7.9
        case .iPad6_8:
            return 12.9
        }
    }
    
    /**
     Get Monitor Type
     */
    public func monitorType() -> DeviceMonitorType {
        switch self {
        case .unKnown:
            return .unKnown
        case .iPhone4_1:
            return .iPhone4
        case .iPhone5_1, .iPhone5_2, .iPhone5_3, .iPhone5_4, .iPhone6_1, .iPhone6_2:
            return .iPhone5
        case .iPhone7_2, .iPhone8_1, .iPhone9_1, .iPhone9_3, .iPhone10_1, .iPhone10_4:
            return .iPhone6
        case .iPhone7_1, .iPhone8_2, .iPhone9_2, .iPhone9_4, .iPhone10_2, .iPhone10_5:
            return .iPhone6Plus
        case .iPhone8_4:
            return .iPhoneSE
        case .iPhone10_3, .iPhone10_6:
            return .iPhoneX
    case .iPad1_1, .iPad2_1, .iPad2_2, .iPad2_3, .iPad2_4, .iPad3_1, .iPad3_2, .iPad3_3, .iPad3_4, .iPad3_5, .iPad3_6, .iPad4_1, .iPad4_2, .iPad4_3, .iPad5_3, .iPad5_4:
            return .iPad
        case .iPad2_5, .iPad2_6, .iPad2_7, .iPad4_4, .iPad4_5, .iPad4_6, .iPad4_7, .iPad4_8, .iPad4_9:
            return .iPadMini
        case .iPod1_1, .iPod2_1, .iPod3_1, .iPod4_1:
            return .iPodTouch
        case .iPod5_1, .iPod7_1:
            return .iPodTouchLarge
        case .iPad6_8:
            return .iPadPro
        }
    }
    
    public var isSupportTouchID: Bool {
        switch self {
        case .iPhone4_1, .iPhone5_1, .iPhone5_2, .iPhone5_3, .iPhone5_4,
             .iPad1_1, .iPad2_1, .iPad2_2, .iPad2_3, .iPad2_4, .iPad2_5, .iPad2_6, .iPad2_7,
             .iPad3_1, .iPad3_2, .iPad3_3, .iPad3_4, .iPad3_5, .iPad3_6,
             .iPad4_1, .iPad4_2, .iPad4_3, .iPad4_4, .iPad4_5, .iPad4_6,
             .iPod1_1, .iPod2_1, .iPod3_1, .iPod4_1, .iPod5_1, .iPod7_1:
            return false
        default:
            return true
        }
    }
}
