//
//  PaymentTableViewController.swift
//  Sikdorak-iOS
//
//  Created by 최준영 on 1/17/24.
//

import UIKit

class PaymentTableViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView()
    
    var stepView = UIView()
    var paymentButton = UIButton()
    
    let mealKitList = MealKit.mockData
    
    
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
        return mealKitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! PaymentTableViewCell
        
        
        
        switch indexPath.row {
            
        case 0: 
            cell.mainImageView.image = UIImage(named: "Buzzi")
            cell.foodNameLabel.text = "부대찌개"
            cell.descriptionLabel.text = """

    80년 정통 존맛 부대찌개 밀키트
       + 라면 사리
       + 스팸
       + 돼지 고기

      합계 금액:                                                                          12,400원
    """
        case 1: 
            cell.mainImageView.image = UIImage(named: "kimchi3")
            cell.foodNameLabel.text = "김치찌개"
            cell.descriptionLabel.text = """

    100년 정통 존맛 김치찌개 밀키트
       + 라면 사리
       + 꽁치
       + 돼지 고기

      합계 금액:                                                                          16,000원
    """
        case 2:
            cell.mainImageView.image = UIImage(named: "brownSoup")
            cell.foodNameLabel.text = "된장찌개"
            cell.descriptionLabel.text = """

    200년 조선시대 정통 존맛 된장찌개 밀키트
       + 조개
       + 차돌박이
       + 두부

      합계 금액:                                                                          20,400원
    """
            
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
        tableView.rowHeight = 300
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
        
        stepView = {
            let view = UIView()
            view.backgroundColor = .green
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
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
