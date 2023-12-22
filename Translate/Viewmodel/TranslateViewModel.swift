//
//  TranslateViewModel.swift
//  Translate
//
//  Created by Jose David Torres Perez on 07/12/23.
//

import Foundation
import UIKit
import Combine


class TranslationViewModel: ObservableObject {
    @Published var originalText = ""
    @Published var translatedText = ""

    var cancellables = Set<AnyCancellable>()
    private let translationService = TranslationService()
    
    func translate(targetLanguage: String) {
        guard !originalText.isEmpty else { return }

        translationService.translate(text: originalText, targetLaguage: targetLanguage) { [weak self] result in
            switch result {
            case .success(let translatedText):
                DispatchQueue.main.async {
                    self?.translatedText = translatedText
                }
            case .failure(let error):
                print("Error en la solicitud: \(error.localizedDescription)")
            }
        }
    }
}

