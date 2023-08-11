//
// This source file is part of the Stanford Spezi open source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

@testable import SpeziMockWebService
import XCTest


final class SpeziMockWebServiceTests: XCTestCase {
    func testSpeziMockWebService() throws {
        let speziMockWebService = SpeziMockWebService()
        XCTAssertEqual(speziMockWebService.stanford, "Stanford University")
    }
}
