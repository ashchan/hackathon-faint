//
// UDT Hackathon Project Gringotts by Team Goblins
// Copyright © 2020 Goblins. all rights reserved.
// 

import Foundation

struct Cell: Decodable, Identifiable {
    let leaseInfo: LeaseInfo
    let outPoint: OutPoint
    let data: String?

    var id: String { outPoint.txHash + outPoint.index }
}

struct LeaseInfo: Decodable {
    let holderLock: String
    let builderPubkeyHash: String
    let coinHash: String
    let leasePeriod: String
    let overduePeriod: String
    let lastPaymentTime: String
    let amountPerPeriod: String
}

struct OutPoint: Decodable {
    let txHash: String
    let index: String
}
