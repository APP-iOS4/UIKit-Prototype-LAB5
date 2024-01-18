//
//  PaymentTableViewController.swift
//  Sikdorak-iOS
//
//  Created by 최준영 on 1/17/24.
//

import UIKit

class PaymentTableViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var stepView = StepView()
    var tableView = UITableView()
    var paymentButton = UIButton()
    
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
        //  장바구니 비우기
        
        
        //Alert 버튼 연결
        showAlert()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! PaymentTableViewCell
        
        
        
        switch indexPath.row {
            
        case 0: 
            cell.mainImageView.image = UIImage(named: "Buzzi")
            cell.mainImageView.clipsToBounds = true
            cell.foodNameLabel.text = "부대찌개"
            cell.priceLabel.text = "35,000 원"
            cell.descriptionLabel.text = "가격 : 8,000 원"


        case 1: 
            cell.mainImageView.image = UIImage(named: "kimchi3")
            cell.mainImageView.clipsToBounds = true
            cell.foodNameLabel.text = "김치찌개"
            cell.priceLabel.text = "34,000 원"
            cell.descriptionLabel.text = "가격 : 7,000 원"

            
        case 2:
            cell.mainImageView.image = UIImage(named: "brownSoup")
            cell.mainImageView.clipsToBounds = true
            cell.foodNameLabel.text = "된장찌개"
            cell.priceLabel.text = "33,000 원"
            cell.descriptionLabel.text = "가격 : 6,000 원"

            
        case 3:
            cell.mainImageView.image = UIImage(named: "Buzzi")
            cell.mainImageView.clipsToBounds = true
            cell.foodNameLabel.text = "부대찌개"
            cell.priceLabel.text = "35,000 원"
            cell.descriptionLabel.text = "가격 : 8,000 원"

            
        case 4:
            cell.mainImageView.image = UIImage(named: "kimchi3")
            cell.mainImageView.clipsToBounds = true
            cell.foodNameLabel.text = "김치찌개"
            cell.priceLabel.text = "34,000 원"
            cell.descriptionLabel.text = "가격 : 7,000 원"

            
        case 5:
            cell.mainImageView.image = UIImage(named: "brownSoup")
            cell.mainImageView.clipsToBounds = true
            cell.foodNameLabel.text = "된장찌개"
            cell.priceLabel.text = "33,000 원"
            cell.descriptionLabel.text = "가격 : 6,000 원"

            

        
            
        default:
            break
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "", message: "결제가 완료되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default){_ in
            //1페이지(intro) 로 돌아가기
            self.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(okAction)
        
        
        present(alert, animated: true, completion: nil)
    }
}



fileprivate extension PaymentTableViewController {
    func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        // 셀의 높이 설정
        tableView.rowHeight = 360
        tableView.register(PaymentTableViewCell.self, forCellReuseIdentifier: "CartCell")
        view.addSubview(tableView)
    }
    
    func setupTableViewConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: stepView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: paymentButton.topAnchor)
        ])
    }
    
    func setUI() {
        
        stepView.step = .payment
        stepView.translatesAutoresizingMaskIntoConstraints = false
        
        paymentButton = {
            let button = UIButton()
            button.setTitle("결제하기", for: .normal)
            button.backgroundColor = .highlight
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
    
        
        [paymentButton, stepView].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stepView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            stepView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            stepView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stepView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            paymentButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            paymentButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            paymentButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            paymentButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    func setAction() {
        paymentButton.addTarget(self, action: #selector(tapPaymentButton), for: .touchUpInside)
    }
    
    
}

#Preview(traits: .defaultLayout) {
    PaymentTableViewController()
}
