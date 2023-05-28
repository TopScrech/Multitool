import Foundation

func gptListModelsAPI(completion: @escaping (Result<Any, Error>) -> Void) {
    guard let request = URLRequest(urlPath: "", httpMethod: .post) else { return }
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error {
            completion(.failure(error))
            return
        }
        
        guard let data else {
            completion(.failure(Errors.noDataRecieved))
            return
        }
        
        do {
            let res = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(res)
            completion(.success(res))
        } catch {
            
        }
    }.resume()
}
