//
//  ApiManager.swift
//  ZenQuotes
//
//  Created by macbook on 10/6/22.
//

import Foundation

struct ApiManager {
    
    let urlString = "https://zenquotes.io/api/random"
    
    func performRequest(url: String, completion: @escaping ((ApiData) -> ())) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let info = self.parseJSON(apiData: safeData) {
                        DispatchQueue.main.async {
                            completion(info)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(apiData: Data) -> ApiData? {
        let decoder = JSONDecoder()
        do {
            let decodedData: [ApiData] = try decoder.decode([ApiData].self, from: apiData)
            let author = decodedData[0].a
            let quote = decodedData[0].q
            let authorAndQuote = ApiData(a: author, q: quote)
            return authorAndQuote
        } catch {
            print(error)
            return nil
        }
    }
}
