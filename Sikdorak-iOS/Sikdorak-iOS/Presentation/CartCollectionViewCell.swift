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
    
    var removeButton = UIButton()
    
    var cartCounterMinusDidChange: (() -> ())?
    
    @objc func cartMinusOne() {
        cartCounterMinusDidChange?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(cartItem: Cart) {
        titleLabel.text = cartItem.name
        removeButton.setTitle("X", for: .normal)
        spicyLabel.text = "맵기: \(cartItem.spicy.rawValue)"
        priceLabel.text = "\(cartItem.price.formatted())원"
        
        let toppingList = cartItem.topping.map { $0.name }
        toppingLabel.text = "토핑: \(toppingList.joined(separator: ", "))"
        
        let sariList = cartItem.sari.map { $0.name }
        sariLabel.text = "사리: \(sariList.joined(separator: ", "))"
    }
}


fileprivate extension CartCollectionViewCell {
    
    func setUI() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        
        removeButton = {
            let button = UIButton()
            button.frame.size = CGSize(width: 20, height: 10)
            button.backgroundColor = .highlight
            button.layer.cornerRadius = 5
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.addTarget(self, action:  #selector(cartMinusOne), for: .touchUpInside)
            return button
        }()
        
        titleLabel = {
            let label = UILabel()
            label.text = "밀키트 이름"
            label.font = .systemFont(ofSize: 18, weight: .semibold)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        spicyLabel = {
            let label = UILabel()
            label.text = "맵기"
            label.font = .systemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        toppingLabel = {
            let label = UILabel()
            label.text = "토핑: "
            label.font = .systemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        sariLabel = {
            let label = UILabel()
            label.text = "사리: "
            label.font = .systemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        priceLabel = {
            let label = UILabel()
            label.text = "20,000원"
            label.font = .systemFont(ofSize: 18, weight: .bold)
            label.textColor = .highlight
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        [titleLabel, removeButton, spicyLabel, toppingLabel, sariLabel, priceLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            removeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 232),
            removeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            removeButton.heightAnchor.constraint(equalToConstant: 20),
            removeButton.widthAnchor.constraint(equalToConstant: 20),
            
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
    cartCell.bind(cartItem: Cart.mockData[0])
    return cartCell
}
