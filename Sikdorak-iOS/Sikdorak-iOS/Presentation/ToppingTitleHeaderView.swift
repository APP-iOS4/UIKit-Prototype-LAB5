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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ title: String) {
        titleLabel.text = title
    }
    
}
