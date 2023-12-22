//
//  TranslateViewController.swift
//  Translate
//
//  Created by Jose David Torres Perez on 06/12/23.
//

import Foundation
import UIKit
import Combine

class TranslateViewController : UIViewController {
    
    let viewModel = TranslationViewModel()
    private var cancellables = Set<AnyCancellable>()
    let translateView = TranslateView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        view.addSubview(translateView)
        setupBindings()
    }
    


    func setupBindings() {
        viewModel.$translatedText
            .sink { [weak self] translatedText in
                DispatchQueue.main.async {
                    self?.translateView.resultTextLabel.text = "\(translatedText)"
                }
            }
            .store(in: &viewModel.cancellables)
    }

}
