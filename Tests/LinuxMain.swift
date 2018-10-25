#if os(Linux)

import XCTest
@testable import AppTests

XCTMain([
    testCase(ParserTests.allTests),
    testCase(ViewTests.allTests),
    testCase(ColorTests.allTests)
])

#endif
