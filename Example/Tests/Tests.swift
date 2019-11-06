// https://github.com/Quick/Quick

import Quick
import Nimble
import SCCSR
import Security

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("these will fail") {
            
            var statusCode: OSStatus
            var publicKey: SecKey?
            var privateKey: SecKey?
                                
            let publicKeyAttr: [String: Any] = [kSecAttrIsPermanent as String:true, kSecAttrApplicationTag as String:"publicTag"]
            let privateKeyAttr: [String: Any] = [kSecAttrIsPermanent as String:true, kSecAttrApplicationTag as String:"privateTag"]
            
            var keyPairAttr = [String: Any]()
            keyPairAttr[kSecAttrKeyType as String] = kSecAttrKeyTypeRSA
            keyPairAttr[kSecAttrKeyType as String] = kSecAttrKeyTypeRSA
            keyPairAttr[kSecAttrKeySizeInBits as String] = 2048
            keyPairAttr[kSecPublicKeyAttrs as String] = publicKeyAttr
            keyPairAttr[kSecPrivateKeyAttrs as String] = privateKeyAttr
            
            statusCode = SecKeyGeneratePair(keyPairAttr as CFDictionary, &publicKey, &privateKey)
            
            if statusCode == noErr {
                guard let publicKey = publicKey, let privateKey = privateKey else {
                    expect(0) == 1
                    return
                }
                
                let csrAttributes = SCCSRAttributes(commonName: "App", organization: "Organization", organizationUnit: "IT", country: "AR", stateOrProvince: "Ciudad de Buenos Aires", locality: "Ciudad de Buenos Aires", serialNumber: "SN 1234567890")
                
                SCCSRHelper.generateCSR(from: privateKey, publicKey: publicKey, attributes: csrAttributes, with: KeyAlgorithm.rsa(signatureType: .sha256)) { csr, error in
                    expect(error).to(beNil())
                    expect(csr).notTo(beNil())
                }
                
            } else {
                expect(0) == 1
            }
            
        }
    }
}
