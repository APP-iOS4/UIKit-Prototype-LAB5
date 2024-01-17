//
//  ToppingCollectionViewCell.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/17/24.
//

import UIKit

class ToppingCollectionViewCell: UICollectionViewCell {
    
    var mealKitImageView = UIImageView()
    var titleLabel = UILabel()
    var priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(topping: Topping) {
//        mealKitImageView.image = UIImage(named: "\(topping.image)")
        titleLabel.text = topping.name
        priceLabel.text = "\(topping.price.formatted(.number))원"
    }
    
}

fileprivate extension ToppingCollectionViewCell {
    
    func setUI() {
        contentView.backgroundColor = .sub
        contentView.layer.cornerRadius = 8
        
        mealKitImageView = {
            let imageView = UIImageView()
            imageView.layer.cornerRadius = 8
            imageView.backgroundColor = .lightGray
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        titleLabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        priceLabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        [mealKitImageView, titleLabel, priceLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            mealKitImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mealKitImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mealKitImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            mealKitImageView.heightAnchor.constraint(equalTo: mealKitImageView.widthAnchor, multiplier: 0.7)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: mealKitImageView.bottomAnchor, constant: 16),
            priceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2)
        ])
    }
    
}
