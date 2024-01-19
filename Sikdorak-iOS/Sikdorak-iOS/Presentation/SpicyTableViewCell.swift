//
//  ToppingTableViewCell.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/18/24.
//

import UIKit

class SpicyTableViewCell: UITableViewCell {
    
    var radiButtonView = UIView()
    var titleLabel = UILabel()
    var explainLabel = UILabel()
//    var bottomIndicatorView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        radiButtonView.backgroundColor = selected ? .highlight : .lightGray
    }
    
    func bind(spicy: Spicy) {
        titleLabel.text = "\(spicy.rawValue)"
        var explain = ""
        
        switch spicy {
        case .a:
            explain = "(맵찔이들이 먹어요)"
        case .b:
            explain = "(신라면 정도의 평범한 맵기에요)"
        case .c:
            explain = "(맵킹들이 먹어요)"
        }
        
        explainLabel.text = explain
    }
    
}


fileprivate extension SpicyTableViewCell {
    
    func setUI() {
        contentView.backgroundColor = .sub
        
        radiButtonView = {
            let view = UIView()
            view.backgroundColor = .lightGray
            view.layer.cornerRadius = 10
            view.layer.borderColor = UIColor.darkGray.cgColor
            view.layer.borderWidth = 2
            view.clipsToBounds = true
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        titleLabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 24, weight: .semibold)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        explainLabel = {
            let label = UILabel()
            label.textColor = .lightGray
            label.font = .systemFont(ofSize: 18, weight: .medium)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
//        bottomIndicatorView.backgroundColor = .lightGray
//        bottomIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        [radiButtonView, titleLabel, explainLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            radiButtonView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            radiButtonView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            radiButtonView.widthAnchor.constraint(equalToConstant: 20),
            radiButtonView.heightAnchor.constraint(equalTo: radiButtonView.widthAnchor, multiplier: 1),
            
            titleLabel.leadingAnchor.constraint(equalTo: radiButtonView.trailingAnchor, constant: 24),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            explainLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 32),
            explainLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
//            bottomIndicatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            bottomIndicatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            bottomIndicatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            bottomIndicatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
}

#Preview(traits: .fixedLayout(width: 1200, height: 60)) {
    let toppingCell = SpicyTableViewCell()
    toppingCell.bind(spicy: .b)
    return toppingCell
}
