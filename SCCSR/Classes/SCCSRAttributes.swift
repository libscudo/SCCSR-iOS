//
//  SCCSRAttributes.swift
//  SCCSR
//
//  Created by Kimi on 06/11/2019.
//

import UIKit

open class SCCSRAttributes: NSObject {
    private(set) var commonName: String?
    private(set) var organization: String?
    private(set) var organizationUnit: String?
    private(set) var country: String?
    private(set) var stateOrProvince: String?
    private(set) var locality: String?
    private(set) var serialNumber: String?
    
    private override init() {}
    
    public init(commonName: String? = nil,
             organization: String? = nil,
             organizationUnit: String? = nil,
             country: String? = nil,
             stateOrProvince: String? = nil,
             locality: String? = nil,
             serialNumber: String? = nil) {
        super.init()
        self.commonName = commonName
        self.organization = organization
        self.organizationUnit = organizationUnit
        self.country = country
        self.stateOrProvince = stateOrProvince
        self.locality = locality
        self.serialNumber = serialNumber
    }
}
