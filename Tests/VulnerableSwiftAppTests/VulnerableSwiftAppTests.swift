import XCTest
@testable import VulnerableSwiftApp

final class VulnerableSwiftAppTests: XCTest {
    
    func testNetworkClient() throws {
        let client = NetworkClient()
        let expectation = XCTestExpectation(description: "Network request")
        
        client.fetchUserData(userId: "123") { data in
            // This test would fail in a real scenario due to insecure HTTP
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}