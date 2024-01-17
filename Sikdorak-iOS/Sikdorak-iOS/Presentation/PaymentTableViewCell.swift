//
//  PaymentTableViewCell.swift
//  Sikdorak-iOS
//
//  Created by 최준영 on 1/17/24.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let foodNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 0
        return label
    }()
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupStackView()
        setConstraints()
    }
    
    func setupStackView() {
        
        
        self.contentView.addSubview(mainImageView)
        self.contentView.addSubview(foodNameLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(removeButtonImage)
        self.contentView.addSubview(removeButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setConstraints() {
        setMainImageViewConstraints()
        setFoodNameLabelConstraints()
        setDescriptionLabelConstraints()
    }
    
    func setMainImageViewConstraints() {
        
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 220),
            mainImageView.widthAnchor.constraint(equalToConstant: 220),
            mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 200),
            mainImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    func setFoodNameLabelConstraints() {
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodNameLabel.heightAnchor.constraint(equalToConstant: 100),
            foodNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 470),
            foodNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
    
    func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.heightAnchor.constraint(equalToConstant: 300),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 800),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 500),
            descriptionLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10)
            
        ])
    }
    
}

#Preview(traits: .defaultLayout) {
    PaymentTableViewController()
}

