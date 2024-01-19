//
//  PaymentTableViewController.swift
//  Sikdorak-iOS
//
//  Created by 최준영 on 1/17/24.
//

import UIKit

class PaymentTableViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    var paymentButton = UIButton()
    var totalPrice = UILabel()
    
    var cartList = Cart.mockData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setTableView()
        setLayout()
        setAction()
        setupTableViewConstraints()
    }
    
    @objc func tapPaymentButton() {
        let nextViewController = PaymentCompleteViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! PaymentTableViewCell
        
        cell.mainImageView.image = UIImage(named: "Buzzi")
        cell.foodNameLabel.text = "\(cartList[indexPath.row].name)"
        cell.descriptionLabel.text = " \(cartList[indexPath.row].price) 원"
        cell.priceLabel.text = "25,000 원"
        
        cell.selectionStyle = .none
        
        return cell
    }
    
}



fileprivate extension PaymentTableViewController {
    func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 360
        tableView.register(PaymentTableViewCell.self, forCellReuseIdentifier: "CartCell")
        view.addSubview(tableView)
    }
    
    func setupTableViewConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: totalPrice.topAnchor)
        ])
    }
    
    func setUI() {
        paymentButton = {
            let button = UIButton()
            button.setTitle("결제하기", for: .normal)
            button.backgroundColor = .highlight
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
            return button
        }()
        
        totalPrice = {
            let label = UILabel()
            label.text = "담은 금액: 68,800원   ."
            label.font = .systemFont(ofSize: 18, weight: .semibold)
            label.textAlignment = .right
            label.textColor = .black
            label.backgroundColor = .sub
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
        [totalPrice, paymentButton].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            paymentButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            paymentButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            paymentButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            paymentButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            totalPrice.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            totalPrice.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            totalPrice.bottomAnchor.constraint(equalTo: paymentButton.topAnchor),
            totalPrice.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    func setAction() {
        paymentButton.addTarget(self, action: #selector(tapPaymentButton), for: .touchUpInside)
    }
    
}

#Preview(traits: .defaultLayout) {
    PaymentTableViewController()
}
