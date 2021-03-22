//
//  APICall.swift
//  Marvel APP
//
//  Created by Raphael Freschi on 21/03/21.
//

import Foundation
import SwiftyJSON

enum comicsError:Error {
    case noDataAvaible
    case canNotProcessData
}

struct ComicsRequest {
    let resourceURL:URL
        var parameters = [
            "ts": "1",
            "limit": "1",
            "offset": "0",
            "apikey": "45cdc4bcc1e5b6b61c0afcf2925b2f36",
            "hash": "5a32b4349da044fd41c730d60a8ddd2c"
        ] as [String : String]
    
    init(comicID: Int, offset: Int){
        let resourceString = "https://gateway.marvel.com:443/v1/public/comics?ts=1&limit=10&offset=\(offset)&apikey=45cdc4bcc1e5b6b61c0afcf2925b2f36&hash=5a32b4349da044fd41c730d60a8ddd2c"
        
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
        
        
    }
    
    func getComics (completion: @escaping(Result<[comicsInfos], comicsError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvaible))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                print("JSON: \(JSON(jsonData))")
                let comicsResponse = try decoder.decode(comicsData.self, from: jsonData.self)
                let comicsDetail = comicsResponse.data.results
                completion(.success(comicsDetail))
            } catch {
                completion(.failure(.canNotProcessData))
            }
            
        }
        
        dataTask.resume()
    }
}


