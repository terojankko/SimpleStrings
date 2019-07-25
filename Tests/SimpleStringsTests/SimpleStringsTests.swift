import XCTest
@testable import SimpleStrings

final class SimpleStringsTests: XCTestCase {

    let testString = "0123456789"

    func testSimpleSubstring() {

        // given
        let expected = "34"

        // when
        let actual = try? testString.substring(start: 3, length: 2)

        // then
        XCTAssertEqual(actual, expected)
    }

    func testEmptySubstring() {

        // given
        let expected = ""
        
        // when
        let actual = try? testString.substring(start: 3, length: 0)

        // then
        XCTAssertEqual(actual, expected)
    }

    func testSubstringWithInvalidStart() {

        // given
        // when
        // then
        XCTAssertThrowsError(try testString.substring(start: 123, length: 10)) { error in
            XCTAssertEqual(error as! SubstringError, SubstringError.overrun)
        }
    }

    func testSubstringWithInvalidLength() {

        // given
        // when
        // then
        XCTAssertThrowsError(try testString.substring(start: 3, length: -1)) { error in
            XCTAssertEqual(error as! SubstringError, SubstringError.invalidLength)
        }
    }


    func testSimpleRange() {

        // given
        let expected = "78"

        // when
        let actual = testString[7...8]

        // then
        XCTAssertEqual(actual, expected)
    }

}
