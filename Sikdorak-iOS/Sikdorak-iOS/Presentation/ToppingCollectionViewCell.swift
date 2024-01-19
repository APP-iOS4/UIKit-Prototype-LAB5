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
    var toppingCountLabel = UILabel()
    var minusButton = UIButton()
    var plusButton = UIButton()
    
    var countButtonAction: (() -> ())?
    
    var toppingCount: Int = 0 {
        didSet {
            toppingCountLabel.text = "\(toppingCount)"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(topping: Topping) {
        mealKitImageView.image = UIImage(named: "\(topping.image)")
        titleLabel.text = topping.name
        priceLabel.text = "+ \(topping.price.formatted(.number))원"
    }
    
    @objc func minusCount() {
        if toppingCount > 0 {
            toppingCount -= 1
            countButtonAction?()
        }
    }
    
    @objc func plusCount() {
        if toppingCount < 999 {
            toppingCount += 1
            countButtonAction?()
        }
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
            label.font = .systemFont(ofSize: 24, weight: .bold)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        priceLabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 20, weight: .medium)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        toppingCountLabel = {
            let label = UILabel()
            label.text = "0"
            label.textColor = .black
            label.textAlignment = .center
            label.backgroundColor = .white
            label.layer.cornerRadius = 4
            label.layer.borderWidth = 0.3
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        minusButton = {
            let button = UIButton()
            button.tintColor = .white
            button.backgroundColor = .highlight
            button.layer.cornerRadius = 6
            button.setImage(UIImage(systemName: "minus"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(minusCount), for: .touchUpInside)
            return button
        }()
        
        plusButton = {
            let button = UIButton()
            button.tintColor = .white
            button.backgroundColor = .highlight
            button.layer.cornerRadius = 6
            button.setImage(UIImage(systemName: "plus"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(plusCount), for: .touchUpInside)
            return button
        }()
        
        [mealKitImageView, titleLabel, priceLabel, toppingCountLabel, minusButton, plusButton].forEach {
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
            priceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -2),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
        ])
        
        NSLayoutConstraint.activate([
            toppingCountLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 16),
            toppingCountLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            toppingCountLabel.widthAnchor.constraint(equalToConstant: 50),
            toppingCountLabel.heightAnchor.constraint(equalToConstant: 30),
            
            minusButton.trailingAnchor.constraint(equalTo: toppingCountLabel.leadingAnchor, constant: -8),
            minusButton.centerYAnchor.constraint(equalTo: toppingCountLabel.centerYAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 20),
            minusButton.heightAnchor.constraint(equalToConstant: 20),
            
            plusButton.leadingAnchor.constraint(equalTo: toppingCountLabel.trailingAnchor, constant: 8),
            plusButton.centerYAnchor.constraint(equalTo: toppingCountLabel.centerYAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 20),
            plusButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
}


#Preview(traits: .fixedLayout(width: 400, height: 440)) {
    let toppingCell = ToppingCollectionViewCell()
    toppingCell.bind(topping: Topping(image: "ramen_sari", name: "라면 사리", price: 1500))
    return toppingCell
}
