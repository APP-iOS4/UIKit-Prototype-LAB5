//
//  CartCollectionViewCell.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/17/24.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    
    var titleLabel = UILabel()
    var spicyLabel = UILabel()
    var toppingLabel = UILabel()
    var sariLabel = UILabel()
    var priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(mealKit: MealKit) {
        titleLabel.text = mealKit.jjigae.name
        spicyLabel.text = "\(mealKit.jjigae.spicy.rawValue)"
        priceLabel.text = "\(mealKit.price.formatted())원"
        
        let toppingList = mealKit.topping.map { $0.name }
        toppingLabel.text = toppingList.joined(separator: ", ")
        
        let sariList = mealKit.sari.map { $0.name }
        sariLabel.text = sariList.joined(separator: ", ")
    }
    
}


fileprivate extension CartCollectionViewCell {
    
    func setUI() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        
        titleLabel = {
            let label = UILabel()
            label.text = "밀키트 이름"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        spicyLabel = {
            let label = UILabel()
            label.text = "맵기"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        toppingLabel = {
            let label = UILabel()
            label.text = "토핑: "
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        sariLabel = {
            let label = UILabel()
            label.text = "사리: "
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        priceLabel = {
            let label = UILabel()
            label.text = "20,000원"
            label.textColor = .highlight
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        [titleLabel, spicyLabel, toppingLabel, sariLabel, priceLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            spicyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            spicyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            
            toppingLabel.leadingAnchor.constraint(equalTo: spicyLabel.leadingAnchor),
            toppingLabel.topAnchor.constraint(equalTo: spicyLabel.bottomAnchor, constant: 2),
            
            sariLabel.leadingAnchor.constraint(equalTo: toppingLabel.leadingAnchor),
            sariLabel.topAnchor.constraint(equalTo: toppingLabel.bottomAnchor, constant: 2),
            
            priceLabel.leadingAnchor.constraint(equalTo: sariLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: sariLabel.bottomAnchor, constant: 8)
        ])
    }
    
}


#Preview(traits: .fixedLayout(width: 300, height: 160)) {
    let cartCell = CartCollectionViewCell()
    cartCell.bind(mealKit: MealKit.mockData[0])
    return cartCell
}
