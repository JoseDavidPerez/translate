//
//  LanguageViewController.swift
//  Translate
//
//  Created by Jose David Torres Perez on 14/12/23.
//

import Foundation
import UIKit

class LanguageViewController : UIViewController {
    private let tableView = UITableView()
    let lenguages = ["Español", "Ingles", "Aleman", "Frances", "Portugues"]
    var selectedLanguage = "es"
    var viewmodel = TranslationViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        title = "Selecciona el idioma"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            
    }
    
    private func getLanguageCode(for language: String) -> String {
        switch language {
        case "Español": return "es"
        case "Ingles": return "en"
        case "Aleman": return "de"
        case "Frances": return "fr"
        case "Portugues": return "pt"
        default: return "es" // Establecer un valor predeterminado
        }
    }
    
    private func translateText() {
        // Llamar al método de traducción con el nuevo idioma
        if let translateViewController = presentingViewController as? TranslateViewController {
            translateViewController.viewModel.translate(targetLanguage: selectedLanguage)
        }
        dismiss(animated: true, completion: nil)
    }
    
}

extension LanguageViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lenguages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let image = UIImageView()
        image.image = UIImage(named: "Espanol")
        image.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(image)
        let label = UILabel()
        label.text = lenguages[indexPath.row]
        label.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(label)
        
        // Configurar las restricciones para la etiqueta
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            image.widthAnchor.constraint(equalToConstant: 40),
            image.heightAnchor.constraint(equalToConstant: 40),
            
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
        ])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44 // Altura de cada celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedLanguage  = getLanguageCode(for: lenguages[indexPath.row])
        translateText()
    }
}
