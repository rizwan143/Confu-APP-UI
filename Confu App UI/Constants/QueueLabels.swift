//
//  ThreadManager.swift
//  AUTest
//
//  Created by Confu Application on 15/11/2019.
//  Copyright © 2019 Shayan Zahid. All rights reserved.
//

import Foundation

struct QueueLabel {
    static let opusEncodingQueue = "com.opusEncodeQueue.confu"
    static let opusDecodingQueue = "com.opusDecodeQueue.confu"
    static let udpReceivingQueue = "com.udpReceivingQueue.confu"
    static let tcpReceivingQueue = "com.tcpReceivingQueue.confu"
    static let tcpClientTimeSyncQueue = "com.tcpClientTimeSyncQueue.confu"
    static let tcpClientCommunicationQueue = "com.tcpClientCommunicationQueue.confu"
    
    static let udpSendingQueue = "com.udpSendingQueue.confu"
    static let speexProcessingQueue = "com.speexProcessingQueue.confu"
    
    static let microphoneLoopingQueue = "com.microphoneLoopingQueue.confu"
    static let coreDataSavingQueue = "com.coreDataSavingQueue.confu"
}
