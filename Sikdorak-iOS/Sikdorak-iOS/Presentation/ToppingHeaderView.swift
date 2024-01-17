//
//  ToppingHeaderView.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/17/24.
//

import UIKit

class ToppingHeaderView: UICollectionReusableView {
    var mealkitImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
//        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var priceLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(mealkitImageView)
        self.addSubview(titleLabel)
        self.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            mealkitImageView.topAnchor.constraint(equalTo: self.topAnchor),
            mealkitImageView.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            mealkitImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mealkitImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: mealkitImageView.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            priceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ mealkit: MealKit) {
        mealkitImageView.image = UIImage(named: "\(mealkit.jjigae.image)")
        titleLabel.text = mealkit.jjigae.name
        priceLabel.text = "\(mealkit.jjigae.price.formatted())원"
    }
}
