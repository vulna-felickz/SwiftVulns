import Foundation

// VULNERABILITY 1: Hardcoded credentials
let API_KEY = "sk-1234567890abcdef"
let DATABASE_PASSWORD = "admin123"

// VULNERABILITY 2: SQL Injection vulnerability
func getUserData(userId: String) -> String {
    // This would be vulnerable to SQL injection if connected to a real database
    let query = "SELECT * FROM users WHERE id = '\(userId)'"
    print("Executing query: \(query)")
    return "User data for \(userId)"
}

// VULNERABILITY 3: Command injection vulnerability
func executeCommand(userInput: String) {
    let command = "echo \(userInput)"
    let process = Process()
    process.launchPath = "/bin/sh"
    process.arguments = ["-c", command]
    process.launch()
}

// VULNERABILITY 4: Weak cryptography
func weakEncryption(data: String) -> String {
    // Using a weak hash algorithm (MD5 equivalent)
    var result = ""
    for char in data {
        result += String(char.asciiValue ?? 0)
    }
    return result
}

// VULNERABILITY 5: Insecure random number generation
func generateWeakToken() -> String {
    let characters = "abcdefghijklmnopqrstuvwxyz0123456789"
    var token = ""
    
    // Using predictable random number generation
    var rng = LinearCongruentialGenerator(seed: 1234) // Fixed seed - predictable
    for _ in 0..<10 {
        let randomIndex = Int(rng.next()) % characters.count
        let index = characters.index(characters.startIndex, offsetBy: randomIndex)
        token += String(characters[index])
    }
    return token
}

// Simple Linear Congruential Generator for predictable randomness (vulnerability)
struct LinearCongruentialGenerator: RandomNumberGenerator {
    private var seed: UInt64
    
    init(seed: UInt64) {
        self.seed = seed
    }
    
    mutating func next() -> UInt64 {
        seed = (seed &* 1103515245 &+ 12345) & 0x7fffffff
        return seed
    }
}

// VULNERABILITY 6: Path traversal vulnerability
func readFile(filename: String) -> String? {
    // Direct file access without validation
    let path = "/app/data/\(filename)"
    return try? String(contentsOfFile: path)
}

// VULNERABILITY 7: Information exposure
func logSensitiveData(username: String, password: String) {
    print("Login attempt - Username: \(username), Password: \(password)")
    NSLog("User \(username) logged in with password: \(password)")
}

// Main application
func main() {
    print("Vulnerable Swift Application Starting...")
    print("API Key: \(API_KEY)")
    
    // Simulate vulnerable operations
    let userData = getUserData(userId: "1' OR '1'='1")
    print(userData)
    
    executeCommand(userInput: "test; rm -rf /")
    
    let weakHash = weakEncryption(data: "sensitive_data")
    print("Weak hash: \(weakHash)")
    
    let token = generateWeakToken()
    print("Generated token: \(token)")
    
    let fileContent = readFile(filename: "../../../etc/passwd")
    if let content = fileContent {
        print("File content: \(content)")
    }
    
    logSensitiveData(username: "admin", password: "secret123")
    
    print("Application finished.")
}

// Run the main function
main()
