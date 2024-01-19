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
        imageView.layer.cornerRadius = 8
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var explainLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용마쉬써용"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ mealkit: MealKit) {
        mealkitImageView.image = UIImage(named: "\(mealkit.jjigae.image)")//?.resize(newWidth: 300)
        titleLabel.text = mealkit.jjigae.name
        priceLabel.text = "\(mealkit.jjigae.price.formatted())원"
    }
    
    func setUI() {
        self.addSubview(mealkitImageView)
        self.addSubview(titleLabel)
        self.addSubview(priceLabel)
        self.addSubview(explainLabel)
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            mealkitImageView.topAnchor.constraint(equalTo: self.topAnchor),
            mealkitImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mealkitImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            mealkitImageView.widthAnchor.constraint(equalToConstant: 300),
//            mealkitImageView.heightAnchor.constraint(equalTo: mealkitImageView.widthAnchor, multiplier: 1),
            
            titleLabel.topAnchor.constraint(equalTo: mealkitImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: mealkitImageView.trailingAnchor, constant: 32),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 4),
            
            explainLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            explainLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            explainLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }

}


#Preview(traits: .fixedLayout(width: 1400, height: 300)) {
    let headerView = ToppingHeaderView()
    headerView.bind(MealKit.mockData[0])
    return headerView
}
