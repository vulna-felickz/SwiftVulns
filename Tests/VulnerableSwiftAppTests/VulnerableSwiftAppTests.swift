import Foundation
import Testing
@testable import VulnerableSwiftApp

struct VulnerableSwiftAppTests {
    
    @Test func testNetworkClient() async throws {
        let client = NetworkClient()
        var callbackExecuted = false
        
        client.fetchUserData(userId: "123") { data in
            // This test would fail in a real scenario due to insecure HTTP
            callbackExecuted = true
        }
        
        // Simple wait to allow callback to execute
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
        
        #expect(callbackExecuted)
    }
}