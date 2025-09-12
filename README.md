# Vulnerable Swift Application

This is a deliberately vulnerable Swift application created for testing CodeQL security analysis.

## Security Vulnerabilities Included:

1. **Hardcoded Credentials** - API keys and passwords in source code
2. **SQL Injection** - Direct string concatenation in SQL queries
3. **Command Injection** - Unsafe command execution with user input
4. **Weak Cryptography** - Poor hashing implementation
5. **Insecure Random Generation** - Predictable random number generation
6. **Path Traversal** - Direct file access without validation
7. **Information Exposure** - Logging sensitive data
8. **Insecure HTTP** - Using HTTP instead of HTTPS
9. **Certificate Validation Bypass** - Disabling SSL certificate checks

## Usage

```bash
swift build
swift run