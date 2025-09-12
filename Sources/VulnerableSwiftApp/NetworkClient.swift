import Foundation

class NetworkClient {
    
    // VULNERABILITY 8: Insecure HTTP connections
    func fetchUserData(userId: String, completion: @escaping (Data?) -> Void) {
        // Using HTTP instead of HTTPS
        let urlString = "http://api.example.com/users/\(userId)"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        // VULNERABILITY 9: Hardcoded API key in headers
        request.setValue("Bearer sk-1234567890abcdef", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data)
        }.resume()
    }
    
    // VULNERABILITY 10: Certificate validation bypass
    func setupInsecureSession() -> URLSession {
        let config = URLSessionConfiguration.default
        let session = URLSession(
            configuration: config,
            delegate: InsecureURLSessionDelegate(),
            delegateQueue: nil
        )
        return session
    }
}

// VULNERABILITY 11: Disabling certificate validation
class InsecureURLSessionDelegate: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        // Always trust the server certificate (DANGEROUS!)
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
}