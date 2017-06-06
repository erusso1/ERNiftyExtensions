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
}
