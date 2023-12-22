//
//  Language.swift
//  Translate
//
//  Created by Jose David Torres Perez on 18/12/23.
//

import Foundation

struct LanguageResponse: Decodable {
    ///Model that contains an array of all the translations.
    struct LanguagesData: Decodable {
        ///Model that contains the text that the user translated.
        struct Language: Decodable {
            ///String that is user translated.
            let languages: String
        }
        ///Array with all traductions.
        let languages: [Language]
    }
    ///Data with translation.
    let data: LanguagesData

}
