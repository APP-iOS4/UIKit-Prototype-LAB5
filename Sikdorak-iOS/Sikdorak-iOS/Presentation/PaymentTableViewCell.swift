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
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let foodNameLabel: UILabel = {
        let label = UILabel()
        label.text = "음식 이름"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "기본가격"
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.6

        return label
    }()
    
    let toppingLabel: UILabel = {
        let label = UILabel()
        label.text = "• 토핑 추가선택 : 스팸 200g 1개 / 소세지 150g 1개 /  두부 반모 "
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.6

        return label
    }()
    
    let sariLabel: UILabel = {
        let label = UILabel()
        label.text = "• 사리 추가선택: 떡국떡 200g / 라면 사리 1개 "
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.6

        return label
    }()
    
    let removeButtonImage = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "X")
        imageView.frame = CGRect(x: 1160, y: 20, width:30, height: 30)
        return imageView
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "해당 항목의 총 가격"
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let changeOptionButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 860, y: 280, width:150, height: 50)
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 8
        
        return button
    }()
       
    let removeButton: UIButton = {
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        let button = UIButton()
        button.backgroundColor = .clear
        button.alpha = 0.35
        button.frame = CGRect(x: 1160, y: 20, width:30, height: 30)
        
       // button.addTarget(self, action: #selector(), for: .touchUpInside)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupStackView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(cartInfo: Cart) {
        let toppingList = cartInfo.topping.map { "+ \($0.name)" }.joined(separator: "\n")
        let sariList = cartInfo.topping.map { "+ \($0.name)" }.joined(separator: "\n")
        
        toppingLabel.text = toppingList
        sariLabel.text = sariList
    }
    
    func setupStackView() {
        self.contentView.addSubview(mainImageView)
        self.contentView.addSubview(foodNameLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(toppingLabel)
        self.contentView.addSubview(sariLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(changeOptionButton)
        self.contentView.addSubview(removeButtonImage)
        self.contentView.addSubview(removeButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            mainImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 16),
            mainImageView.heightAnchor.constraint(equalToConstant: 220),
            mainImageView.widthAnchor.constraint(equalToConstant: 220),
        ])
        
        NSLayoutConstraint.activate([
            foodNameLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 64),
            foodNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: foodNameLabel.leadingAnchor, constant: 4),
            descriptionLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 10),
          
            toppingLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: 0),
            toppingLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            
            sariLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: 0),
            sariLabel.topAnchor.constraint(equalTo: toppingLabel.bottomAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 64),
            priceLabel.topAnchor.constraint(equalTo: sariLabel.topAnchor, constant: 64)
        ])
    }
    
}

#Preview(traits: .defaultLayout) {
    let paymentTableViewCell = PaymentTableViewCell()
    paymentTableViewCell.bind(cartInfo: Cart.mockData[0])
    return paymentTableViewCell
}
