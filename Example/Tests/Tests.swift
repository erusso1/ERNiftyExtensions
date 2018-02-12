import UIKit
import XCTest
import ERNiftyExtensions

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
}
