//
//  Translate.swift
//  Translate
//
//  Created by Jose David Torres Perez on 07/12/23.
//

import Foundation
///Model that contains the responde of the translacions services.
struct TranslationResponse: Decodable {
    ///Model that contains an array of all the translations.
    struct TranslationData: Decodable {
        ///Model that contains the text that the user translated.
        struct Translation: Decodable {
            ///String that is user translated.
            let translatedText: String
        }
        ///Array with all traductions.
        let translations: [Translation]
    }
    ///Data with translation.
    let data: TranslationData

}
