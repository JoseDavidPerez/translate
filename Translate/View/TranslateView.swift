//
//  TranslateView.swift
//  Translate
//
//  Created by Jose David Torres Perez on 18/12/23.
//

import Foundation
import UIKit

class TranslateView : UIView {
    
    let viewModel = TranslationViewModel()
    var selectedLanguage = "es"
    var navigationController : UINavigationController?
    
    let textTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.backgroundColor = .white
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let originStackView : UIStackView = {
       let stack = UIStackView()
        stack.backgroundColor = .white
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillProportionally
        return stack
    }()
    
    let traduccionStackView : UIStackView = {
       let stack = UIStackView()
        stack.backgroundColor = .white
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillProportionally
        return stack
    }()
    
    let resultTextLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonStackView : UIStackView  = {
      let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var translateButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Translate", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action:  #selector(handleTranslate), for: .touchUpInside)
        return button
    }()
    
    lazy var clearButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action:  #selector(handleClear), for: .touchUpInside)
        return button
    }()
    
    lazy var changeLanguagesButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Changes", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action:  #selector(handleChangeLanguage), for: .touchUpInside)
        return button
    }()
    
    lazy var originLanguagesImage: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "Espanol.png")
        
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleAnotherLenguages), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var sourceLanguagesImage: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "Espanol.png")
        
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleAnotherLenguages), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var traduccionLanguagesImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "inglesbandera.png")!
        image.translatesAutoresizingMaskIntoConstraints = false
        let button = UIButton()
        button.addTarget(self, action: #selector(handleAnotherLenguages), for: .touchUpInside)
        image.layer.cornerRadius = 10
        return image
    }()
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
        super.init(frame: CGRect.zero)
        // Configura el resto de tu vista
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        

        addSubview(changeLanguagesButton)
        addSubview(originStackView)
        originStackView.addSubview(textTextField)
        originStackView.addSubview(originLanguagesImage)
        addSubview(traduccionStackView)
        traduccionStackView.addSubview(resultTextLabel)
        traduccionStackView.addSubview(sourceLanguagesImage)
        addSubview(buttonStackView)
        buttonStackView.addSubview(translateButton)
        buttonStackView.addSubview(clearButton)
        
        NSLayoutConstraint.activate([
            
            originStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            originStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            originStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            originStackView.heightAnchor.constraint(equalToConstant: 150),
            
            textTextField.topAnchor.constraint(equalTo: originStackView.topAnchor, constant: 15),
            textTextField.leftAnchor.constraint(equalTo: originStackView.leftAnchor, constant: 55),
            textTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            textTextField.heightAnchor.constraint(equalToConstant: 50),
            
            traduccionStackView.topAnchor.constraint(equalTo: originStackView.bottomAnchor, constant: 20),
            traduccionStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            traduccionStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            traduccionStackView.heightAnchor.constraint(equalToConstant: 150),
            
            resultTextLabel.topAnchor.constraint(equalTo: traduccionStackView.topAnchor, constant: 15),
            resultTextLabel.leftAnchor.constraint(equalTo: traduccionStackView.leftAnchor, constant: 55),
            resultTextLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            resultTextLabel.heightAnchor.constraint(equalToConstant: 50),
            
            buttonStackView.topAnchor.constraint(equalTo: traduccionStackView.bottomAnchor, constant: 5),
            buttonStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            buttonStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            
            clearButton.leftAnchor.constraint(equalTo: buttonStackView.leftAnchor, constant: 5),
            translateButton.leftAnchor.constraint(equalTo: clearButton.rightAnchor, constant: 5),
            
            changeLanguagesButton.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 20),
            changeLanguagesButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            changeLanguagesButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            changeLanguagesButton.heightAnchor.constraint(equalToConstant: 50),
            
            originLanguagesImage.heightAnchor.constraint(equalToConstant: 50),
            originLanguagesImage.widthAnchor.constraint(equalToConstant: 50),
            
            sourceLanguagesImage.heightAnchor.constraint(equalToConstant: 50),
            sourceLanguagesImage.widthAnchor.constraint(equalToConstant: 50),
            
            
        ])
    }
    
    @objc func handleTranslate() {
        viewModel.originalText = textTextField.text ?? ""
        viewModel.translate(targetLanguage: selectedLanguage)
    }
    
    @objc func handleClear(){
        textTextField.text = ""
        resultTextLabel.text = ""
    }
    
    @objc func handleChangeLanguage(){
        let resultLabel = resultTextLabel.text
        resultTextLabel.text = textTextField.text ?? ""
        textTextField.text = resultLabel
    }
    @objc func handleAnotherLenguages(){
        if let navigationController = self.navigationController {
            let languageViewController = LanguageViewController()
            navigationController.pushViewController(languageViewController, animated: true)
            print("hola")
        }
    }

}
