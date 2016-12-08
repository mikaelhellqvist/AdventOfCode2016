import XCTest

@testable import Day_2

class CodeBoxTests: XCTestCase {

    var sut : CodeBox!
    let converter = Converter()
    
    override func setUp() {
        super.setUp()
        sut = CodeBox()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testThatExampleCodeShouldBe_1985() {
        let codeString = "ULL\nRRDDD\nLURDL\nUUUUD"
        let codeArray = converter.convertDataToArrays(code: codeString)
    
        sut.codeSheet = codeArray
        
        let code : [Key] = sut.crackCode() as! [Key]
        
        XCTAssertEqual(code, [Key(k: "1"),Key(k: "9"),Key(k: "8"),Key(k: "5")])
    }
    
    func testThatExampleCodeShouldBe_5DB3_WhenInAdvanced() {
        let codeString = "ULL\nRRDDD\nLURDL\nUUUUD"
        let codeArray = converter.convertDataToArrays(code: codeString)
        
        sut = CodeBox(codeSheet: codeArray, isSimple: false)
        let code : [Key] = sut.crackCode() as! [Key]
        
        XCTAssertEqual(code, [Key(k: "5"),Key(k: "D"),Key(k: "B"),Key(k: "3")])
    }
}
