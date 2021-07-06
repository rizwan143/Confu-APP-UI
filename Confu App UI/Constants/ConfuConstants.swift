//
//  Audio.swift
//  Confu
//
//  Created by Shayan on 18/05/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import Foundation
import UIKit

class ConfuConstants {
    
    static let UDP_PORT: Int32 = 4002
    static let TIME_SYNC_TCP_PORT: Int32 = 123
    static let RECORDING_SYNC_TCP_PORT: Int32 = 1001
    
    static var deviceLatency = 0.0 // Device Input and output total Latency
    
    static var SENT_AND_RECEIVE = 20
    
    typealias RecordingTuple = (Double, Double, UInt32)
    static var sendRecordingCycles = [RecordingTuple]()
    static var recordingCycles40 = [RecordingTuple]()
    static var recordingCycles18 = [RecordingTuple]()
    static var RecordingPrediction: (Double, UInt32) = (ssn: 0, buffer: 0)
    static var CurrentSSN40: Double = 0
    static var CurrentSSN18: Double = 0
    static var FUTURE_SSN40: Double = 0
    static var FUTURE_SSN18: Double = 0
    
    static var LOCAL_BUFFER_SERVER: UInt32 = 0
    static var SERVER_SSN18: Double = 0
    
  //  static let silenceBuffer = [Int16](repeating: 0, count: Int(AudioConfiguration.kFrameSize))
    
    static var myIP: String = ""
    static var myUUID: String = ""
    
    static var FUTURE_PREDICTION: (Double, Double, UInt32) = (futureSSN: 0, ntp: 0, buffer: 0)
    
//    static func predictedSSN(currentSSN40: Double, clientPredictedRecordTime: Double) -> (Double, Double, UInt32) {
//        let x = (clientPredictedRecordTime * 3.0) * 8.0
//        let a = currentSSN40 + x
////        let z = currentSSN40.round(to: 2) + x
//        var buffer: UInt32 = 0
//        var ssn40Rounded2: Double = 0
//
//        for recordingCycle40 in ConfuConstants.recordingCycles40 {
//            if (abs(recordingCycle40.0 - a).truncatingRemainder(dividingBy: 8)) == 0.0 {
//                buffer = recordingCycle40.2
//                ssn40Rounded2 = recordingCycle40.1
//                break
//            }
//        }
//
//        let y = buffer + 1792
//
//        let predictedNTP = (ConfuConstants.SLOPE40 * a) + ConfuConstants.INTERCEPT40
//
//        return (a, predictedNTP.round(to: 2), y)
//    }
    
    static var INTERCEPT: Double = 0
    static var SLOPE: Double = 0
    
    static var INTERCEPT40: Double = 0
    static var SLOPE40: Double = 0
    
    static var PREDICTED_CLIENT_BUFFER: Int64 = 0
    static var PREDICTED_CLIENT_SSN18: Double = 0
    
    static var recordIntercept: Double = 0
    static var recordSlope: Double = 0
    
    static var sendIntercept: Double = 0
    static var sendSlope: Double = 0
    
    static var indexedBufferCountAtTimeStamp: Int64 = 0
    static var serverSetFutureSSN: Double = 0
    
    static var currentSendingNumberForSend: Double = 0
    
//    static var OUTGOING_CALL_UUID = UUID()
//    static var INCOMING_CALL_UUID = UUID()
//    static let TCP_COM_PORT: Int32 = 1110
    
    static let WELL_KNOWN_PORTS = [10000, 10022, 10024, 10033, 10035, 10036, 10007, 10308, 10039, 10400, 10401, 10404, 10048, 10409, 10500, 10503, 10054,
    10056, 10058, 10059, 10064, 10065, 10066, 10069, 10071, 10074, 10080, 11010, 10234, 10433, 10494, 10521, 10720, 10723, 10755, 10761, 10801, 10900, 10935, 10998, 20050,
    20003, 20005, 20049, 21003, 21005, 21007, 21021, 21061, 23001, 23083, 24001, 26001, 27107, 28609, 29067, 35000, 30001, 31028, 32068, 33006, 33809, 36089, 36900, 30703,
    39806, 40000, 40001, 40405, 48909, 50660, 50001, 50003, 50009, 50500, 50501, 50600, 51001, 51020, 51090, 53507, 54302, 55550, 56301, 56606, 58000, 59000, 59001, 60004,
    32771, 49152, 49157, 50000]
    
    static var TCP_COM_PORT = 1417
    
    static func randomizeTCPPort() {
        
//        Constants.TCP_COM_PORT = WELL_KNOWN_PORTS.randomElement()!
    }
    
    
    static let endPushKit = "endPushkitCall"
    
    
    static let checkPeerConnectionMap = "checkPeerConnectionMap"
    
    static let SYNC_MODE_DEFAULT = 0
    static let SYNC_MODE_NORMAL = 1;
    static let SYNC_MODE_EXTREME = 2;
    
    static let COM_CALL_END = "CALLEND"
    
    static var PacketLossCount: Int32 = 0
    
    static var DELAY: Int32 = 50
    static var SERVER_DELAY: Int32 = 50
    
    static var INTRODUCE_DELAY = false
    static var REMOVE_DELAY = false
    
    static let COM_SEND_PACKET = "sendPacket";
    static let COM_DBVAD_PACKET = "DBVAD";
    static var LocalStreamsSecquenceNumbers: Int32 = -1
    
    static let VOICE_ACTIVITY_THRESH_HOLD = 5100
    
    static let CLIENT_SMOOTHING_FACTOR = 0.3
    
    static let MAX_PACKET_PLAYER: Int32 = 6
    
    static var MYIP: String = ""
    
    //static var FrameTimeStamp: Int32 = (-OpusSettings.SAMPLE_RATE / 25 )
    
    static var BARGIN_THRESHOLD: Float32 = 35.0
    
    //static var FIREBASE_NETWORK_MODEL: FirebaseNetworkModel?
    
    static var muteClientOnConditions = false
    
    static var globalMin: Float32 = 500
    static var globalMax: Float32 = 0
    
    static var fileData: Data?
    
    static var testVC: UIViewController?
    
    static var NTP_OFF_SET: Int64 = 0
    
    static let dummyVariable : Float = 0.01

    static func framesToMilli(frame: Int32, samplingRate: Int32) -> Int32 {
        let samplesToMillis = samplingRate / 1000
        return frame / samplesToMillis
    }
    
    static func milliToFrames(milli: Int32, samplingRate: Int32) -> Int32 {
        let samplesToMillis = samplingRate / 1000
        return milli * samplesToMillis
    }
   // static var emaGlobalList = [String: EMA]()
    
    //Add static variables to reset their values here at the end of call
    static func resetVariables(){
        ConfuConstants.CurrentSSN40 = 0
        ConfuConstants.CurrentSSN18 = 0
        ConfuConstants.NTP_OFF_SET = 0
        
        ConfuConstants.INTERCEPT = 0
        ConfuConstants.SLOPE = 0
        
        ConfuConstants.INTERCEPT40 = 0
        ConfuConstants.SLOPE40 = 0
        
        ConfuConstants.PREDICTED_CLIENT_BUFFER = 0
        ConfuConstants.PREDICTED_CLIENT_SSN18 = 0
        
        ConfuConstants.recordIntercept = 0
        ConfuConstants.recordSlope = 0
        
        ConfuConstants.sendIntercept = 0
        ConfuConstants.sendSlope = 0
        
        ConfuConstants.indexedBufferCountAtTimeStamp = 0
        ConfuConstants.serverSetFutureSSN = 0
        
        ConfuConstants.currentSendingNumberForSend = 0
        
        ConfuConstants.sendRecordingCycles = [RecordingTuple]()
        ConfuConstants.recordingCycles40 = [RecordingTuple]()
        ConfuConstants.recordingCycles18 = [RecordingTuple]()
        ConfuConstants.RecordingPrediction = (ssn: 0, buffer: 0)
        ConfuConstants.CurrentSSN40 = 0
        ConfuConstants.CurrentSSN18 = 0
        ConfuConstants.FUTURE_SSN40 = 0
        ConfuConstants.FUTURE_SSN18 = 0
    }
}

struct FileDataStruct {
    static var fileData: Data? = Data()
}
