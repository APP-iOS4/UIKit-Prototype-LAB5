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
        button.setTitle("인트로 이미지", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    /*
    let removeButtonImage = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "X")
        imageView.frame = CGRect(x: 1160, y: 20, width:30, height: 30)
        return imageView
    }()
    
    let removeButton: UIButton = {
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        let button = UIButton()
        button.backgroundColor = .clear
        button.alpha = 0.35
        button.frame = CGRect(x: 1160, y: 20, width:30, height: 30)
        
        //button.addTarget(self, action: #selector(), for: .touchUpInside)
         
        return button
    }()
     */
    
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
