//
//  ToppingTitleHeaderView.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/17/24.
//

import UIKit

class ToppingTitleHeaderView: UICollectionReusableView {
    
    var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var optionalLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = " 선택 "
        label.textColor = .darkGray
        label.backgroundColor = .lightGray
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        self.addSubview(optionalLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            optionalLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            optionalLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ title: String) {
        titleLabel.text = title
    }
    
}

#Preview(traits: .fixedLayout(width: 1200, height: 50)) {
    let titleHeaderView = ToppingTitleHeaderView()
    titleHeaderView.bind("토핑")
    return titleHeaderView
}
