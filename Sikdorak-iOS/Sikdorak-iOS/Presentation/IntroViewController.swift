//
//  ViewController.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/16/24.
//

import UIKit

class IntroViewController: BaseViewController {

    var fullScreenButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Intro"), for: .normal)
        button.layer.opacity = 0.8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(fullScreenButton)
        setLayout()
        setAction()
    }
    
    @objc func tapAction() {
        let selectMenuViewController = SelectMenuViewController()
        self.navigationController?.pushViewController(selectMenuViewController, animated: true)
    }

}


fileprivate extension IntroViewController {
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            fullScreenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fullScreenButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            fullScreenButton.topAnchor.constraint(equalTo: view.topAnchor),
            fullScreenButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setAction() {
        fullScreenButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
}


#Preview(traits: .defaultLayout) {
    IntroViewController()
}
