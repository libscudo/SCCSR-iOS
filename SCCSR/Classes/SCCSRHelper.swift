//
//  SCCSRHelper.swift
//  SCCSR
//
//  Created by Kimi on 06/11/2019.
//

import UIKit
import Security

enum SCCSRError : Error {
    case couldNotCreateCSR
    case couldNotLoadPublicKey
}

open class SCCSRHelper: NSObject {

    public static func generateCSR(from privateKey: SecKey, publicKey: SecKey, attributes attr: SCCSRAttributes, with algoritm: KeyAlgorithm, _ completion: @escaping((_ csr: String?, _ error: Error?) -> Void)) {
        
        let impl = SCCSRImpl(commonName: attr.commonName,
                             organizationName: attr.organization,
                             organizationUnitName: attr.organizationUnit,
                             countryName: attr.country,
                             stateOrProvinceName: attr.stateOrProvince,
                             localityName: attr.locality,
                             serialNumber: attr.serialNumber,
                             keyAlgorithm: algoritm)
        
        var error:Unmanaged<CFError>?
        
        if let cfdata = SecKeyCopyExternalRepresentation(publicKey, &error) {
           let publicKeyData : Data = cfdata as Data
           //let b64Key = publicKeyData.base64EncodedString()
        
            if let csr = impl.buildCSRAndReturnString(publicKeyData, privateKey: privateKey) {
                completion(csr, nil)
                return
            }
            completion(nil, SCCSRError.couldNotCreateCSR)
            return
        }
        completion(nil, SCCSRError.couldNotLoadPublicKey)
    }
    
}
