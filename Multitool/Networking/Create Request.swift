import Foundation

extension URLRequest {
    enum HttpMethod: String {
        case get
        case post
        case put
        case delete
    }
    
    private static var apiBaseURL: String {
        return "https://mgr.bisquit.host/api/"
    }
    
    init?(urlPath: String, httpMethod: HttpMethod, body: Encodable? = nil) {
        let urlString = URLRequest.apiBaseURL + urlPath
        guard let url = URL(string: urlString) else { return nil }
        
        self.init(url: url)
        self.httpMethod = httpMethod.rawValue.uppercased()
        self.setValue("application/json", forHTTPHeaderField: "Accept")
        self.setValue("application/json", forHTTPHeaderField: "Content-Type")
        self.setValue("Bearer " + UserSettings().apiKeyGpt, forHTTPHeaderField: "Authorization")
        
        if let body = body {
            let encoder = JSONEncoder()
            self.httpBody = try? encoder.encode(body)
        }
    }
}
