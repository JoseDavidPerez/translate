//
//  ManagerApi.swift
//  Translate
//
//  Created by Jose David Torres Perez on 07/12/23.
//

import Foundation
import Combine

class TranslationService {
    
    private let rapidAPIKey = "74b279f2b8msh92543f926d4f234p1f587cjsne34a50a8cc38"
    private let translationURL = URL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2")!

    func translate(text: String, completion: @escaping (Result<String, Error>) -> Void) {
        let parameters: [String: Any] = [
            "q": text,
            "target": "es"
        ]

        var request = URLRequest(url: translationURL)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(rapidAPIKey, forHTTPHeaderField: "X-RapidAPI-Key")
        request.httpBody = parameters.map { "\($0)=\($1)" }.joined(separator: "&").data(using: .utf8)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                let error = NSError(domain: "TranslationService", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }

            do {
                let translationResponse = try JSONDecoder().decode(TranslationResponse.self, from: data)
                let translatedText = translationResponse.data.translations.first?.translatedText ?? "No se pudo obtener la traducción."
                completion(.success(translatedText))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

