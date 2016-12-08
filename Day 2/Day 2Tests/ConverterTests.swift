import XCTest

@testable import Day_2

class ConverterTests: XCTestCase {

    var sut: Converter!
    
    override func setUp() {
        super.setUp()
        sut = Converter()
        
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testThatArrayIsReturnedFromString() {
        let code = "LR\nUD\nDU"
        
        let array = sut.convertDataToArrays(code: code)
        print(array)
        XCTAssertEqual(array[0], ["L","R"])
        XCTAssertEqual(array[1], ["U","D"])
        XCTAssertEqual(array[2], ["D","U"])
    }
}
