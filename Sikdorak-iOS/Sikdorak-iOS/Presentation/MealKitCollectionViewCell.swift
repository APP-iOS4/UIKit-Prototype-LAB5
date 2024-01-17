//
//  MealKitCollectionViewCell.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/16/24.
//

import UIKit

class MealKitCollectionViewCell: UICollectionViewCell {
    
    var mealKitImageView = UIImageView()
    var likeImageView = UIImageView()
    var likeCountLabel = UILabel()
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
    
    func bind(mealKit: MealKit) {
        mealKitImageView.image = UIImage(named: "\(mealKit.jjigae.image)")
        likeCountLabel.text = mealKit.likeCount.formatted(.number)
        titleLabel.text = mealKit.jjigae.name
        priceLabel.text = "\(mealKit.jjigae.price.formatted(.number))원 ~"
    }
    
}


fileprivate extension MealKitCollectionViewCell {
    
    func setUI() {
        contentView.backgroundColor = .sub
        contentView.layer.cornerRadius = 8
        
        mealKitImageView = {
            let imageView = UIImageView()
            imageView.layer.cornerRadius = 8
            imageView.backgroundColor = .lightGray
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        likeImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "hand.thumbsup.circle.fill")
            imageView.tintColor = .highlight
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        likeCountLabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 18, weight: .medium)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        titleLabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 20, weight: .bold)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        priceLabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 20, weight: .semibold)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        [mealKitImageView, likeImageView, likeCountLabel, titleLabel, priceLabel].forEach {
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
            likeCountLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 8),
            likeCountLabel.topAnchor.constraint(equalTo: mealKitImageView.bottomAnchor, constant: 12),
            
            likeImageView.trailingAnchor.constraint(equalTo: likeCountLabel.leadingAnchor, constant: -2),
            likeImageView.centerYAnchor.constraint(equalTo: likeCountLabel.centerYAnchor),
            
            likeImageView.widthAnchor.constraint(equalToConstant: 20),
            likeImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: likeCountLabel.bottomAnchor, constant: 6),
            
            priceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6)
        ])
    }
    
}


#Preview(traits: .fixedLayout(width: 400, height: 400)) {
    let mealKitCell = MealKitCollectionViewCell()
    mealKitCell.bind(mealKit: MealKit.mockData[0])
    return mealKitCell
}
