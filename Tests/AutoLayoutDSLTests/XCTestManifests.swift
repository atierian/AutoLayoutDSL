import XCTest

#if !canImport(ObjectiveC) && canImport(UIKit)
import UIKit

public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AutoLayoutDSLTests.allTests),
    ]
}
#endif
