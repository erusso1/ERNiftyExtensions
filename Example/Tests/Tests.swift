import UIKit
import XCTest
import ERNiftyExtensions

class TestTableViewCell: UITableViewCell {
    
    
}

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTableRegistration() {
        
        let tableView = UITableView()
        
        tableView.register(TestTableViewCell.self)
        
        XCTAssertEqual(TestTableViewCell.identifier, "TestTableViewCell")
    }
    
    func testArray() {
        
        var t = ["Joe", "John", "Jim", "Jerry", "James"]
        let r = t.remove("John")

        XCTAssert(r == "John")
        XCTAssert(t.count == 4)
        XCTAssertNil(t.remove("Bill"))
    }
    
    func testBundle() {
        
        let b: String? = Bundle.main.object(forInfoPlistKey: String(kCFBundleInfoDictionaryVersionKey))
        
        XCTAssertNotNil(b)
    }
    
    func testRandomInt() {
        
        var minimum = Int.max
        
        var maximum = 0
        
        let lowerBound = 3
        
        let upperBound = 7
        
        for _ in 0..<100 {
        
            let rand = Int.random(between: lowerBound...upperBound)
            
            minimum = min(minimum, rand)
            
            maximum = max(maximum, rand)
            
            print(rand)
        }
        
        print("Min value: \(minimum)")
        
        print("Max value: \(maximum)")
        
        XCTAssert(minimum == lowerBound, "The minimum value generated is less than the lower bound.")
        
        XCTAssert(maximum == upperBound, "The maximum value generated is greater than the upper bound.")

    }

    func testRandomDouble() {
        
        for _ in 0..<100 {
            
            let rand = Double.random(between: 0.0...1.0).roundedTo(places: 2)
            
            print(rand)
        }
    }
    
    func testRandomString() {
        
        for _ in 0..<100 {
            
            print(String.random(length: 128))
        }
    }
    
    func testEncryption() {
        
        let key = String.random(length: 32)
        
        let iv = String.random(length: 16)

        let json = ["username" : "SkankHunt42", "token" : "wkbvwkrgvhwbgirkwirubgliwrngli", "SSN" : "123-45-6789"]
        
        let rawData = try! JSONSerialization.data(withJSONObject: json, options: [])
        
        print("Raw data: \(rawData)")

        print("")
        let encryptedData = rawData.encrptedAES(withKey: key, iv: iv)
        
        print("Encrypted data: \(encryptedData)")
        print("")

        let decryptedData = encryptedData.decryptedAES(withKey: key, iv: iv)
        
        print("Decrypted data: \(decryptedData)")
        print("")
        
        print(try! JSONSerialization.jsonObject(with: decryptedData, options: []))

        //print(String.init(data: rawData, encoding: .utf8)!, String.init(data: encryptedData, encoding: .utf8)!, String.init(data: decryptedData, encoding: .utf8)!)

        XCTAssertEqual(decryptedData, rawData)
    }
}
