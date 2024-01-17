//
//  PaymentTableViewController.swift
//  Sikdorak-iOS
//
//  Created by 최준영 on 1/17/24.
//

import UIKit

class PaymentTableViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var stepView = UIView()
    var cartView = UIView()
    var paymentButton = UIButton()
    
    let mealKitList = MealKit.mockData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setAction()
    }
    
    @objc func tapOrderButton() {
        let paymentTableViewController = PaymentTableViewController()
        self.navigationController?.pushViewController(paymentTableViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}



fileprivate extension PaymentTableViewController {
    
    func setUI() {
       
        
        let tableView: UITableView = {
            let tableview = UITableView()
            return tableview
        }()
        
        let foodImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "icon")
            return imageView
        }()
        
        let label: UILabel = {
            let label = UILabel()
            label.text = "부대찌개"
            label.textColor = UIColor.gray
            return label
        }()
        
        paymentButton = {
            let button = UIButton()
            button.setTitle("결제하기", for: .normal)
            button.backgroundColor = .highlight
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        /*
        mealKitImageView = {
            let imageView = UIImageView()
            imageView.layer.cornerRadius = 8
            imageView.backgroundColor = .lightGray
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
         */
        
        [paymentButton].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            paymentButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            paymentButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            paymentButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            paymentButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setAction() {
        paymentButton.addTarget(self, action: #selector(tapOrderButton), for: .touchUpInside)
    }
    
}

#Preview(traits: .defaultLayout) {
    PaymentTableViewController()
}
