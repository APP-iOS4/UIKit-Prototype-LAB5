//
//  SelectMenuViewController.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/16/24.
//

import UIKit

class SelectMenuViewController: BaseViewController {
    
    var stepView = UIView()
    var mealKitCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var cartView = UIView()
    var orderButton = UIButton()

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
}


extension SelectMenuViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let toppingViewController = ToppingViewController()
        toppingViewController.mealKitInfo = mealKitList[indexPath.row]
        self.navigationController?.pushViewController(toppingViewController, animated: true)
    }
    
}

extension SelectMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 32) / 4 - 1
        return CGSize(width: width, height: width)
    }
}

extension SelectMenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mealKitList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealKitCell", for: indexPath) as! MealKitCollectionViewCell
        cell.bind(mealKit: mealKitList[indexPath.row])
        return cell
    }
    
}

fileprivate extension SelectMenuViewController {
    
    func setUI() {
        self.title = "밀키트"
        navigationController?.navigationBar.tintColor = .highlight
        navigationController?.navigationBar.backgroundColor = .sub
        
        stepView = {
            let view = UIView()
            view.backgroundColor = .green
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        mealKitCollectionView = {
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.minimumLineSpacing = 4
//            flowLayout.minimumInteritemSpacing = 2
            collectionView.collectionViewLayout = flowLayout
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(MealKitCollectionViewCell.self, forCellWithReuseIdentifier: "MealKitCell")
            collectionView.backgroundColor = .main
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            return collectionView
        }()
        
        cartView = {
            let view = UIView()
            view.backgroundColor = .red
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        orderButton = {
            let button = UIButton()
            button.setTitle("주문하기", for: .normal)
            button.backgroundColor = .highlight
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        [stepView, mealKitCollectionView, cartView, orderButton].forEach {
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
            mealKitCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            mealKitCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            mealKitCollectionView.topAnchor.constraint(equalTo: stepView.bottomAnchor, constant: 16),
            mealKitCollectionView.bottomAnchor.constraint(equalTo: cartView.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cartView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            cartView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            cartView.bottomAnchor.constraint(equalTo: orderButton.topAnchor),
            cartView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            orderButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            orderButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            orderButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            orderButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setAction() {
        orderButton.addTarget(self, action: #selector(tapOrderButton), for: .touchUpInside)
    }
    
}


#Preview(traits: .defaultLayout) {
    SelectMenuViewController()
}
