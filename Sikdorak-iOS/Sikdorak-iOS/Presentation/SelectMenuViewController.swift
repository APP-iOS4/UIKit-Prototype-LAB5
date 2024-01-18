//
//  SelectMenuViewController.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/16/24.
//

import UIKit

class SelectMenuViewController: BaseViewController {
    
    var mealKitCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    var cartView = UIView()
    var cartCountTitleLabel = UILabel()
    var cartCountLabel = UILabel()
    var totalPriceTitleLabel = UILabel()
    var totalPriceLabel = UILabel()
    var cartCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    var orderButton = UIButton()
    let toppingSelectedButton: UIButton = UIButton()
    let cartSelectedButton: UIButton = UIButton()
    
    let mealKitList: [MealKit] = MealKit.mockData
    var cartList: [Cart] = Cart.mockData {
        didSet {
            cartView.isHidden = cartList.count == 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setAction()
    }
    
    // 주문하기 버튼
    @objc func tapOrderButton() {
        let paymentTableViewController = PaymentTableViewController()
        paymentTableViewController.cartList = cartList
        self.navigationController?.pushViewController(paymentTableViewController, animated: true)
    }
    
    // 토핑 고르기 버튼
    @objc func toppingSelectedButtonTapped() {
        let toppinViewController = ToppingViewController()
        navigationController?.pushViewController(toppinViewController, animated: true)
    }
}

extension SelectMenuViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case mealKitCollectionView:
            let toppingViewController = ToppingViewController()
            toppingViewController.mealKitInfo = mealKitList[indexPath.row]
            self.navigationController?.pushViewController(toppingViewController, animated: true)
            
        default: break
        }
    }
}

extension SelectMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 메뉴 컬렉션 뷰 크기 설정
        switch collectionView {
        case mealKitCollectionView:
            let width = (collectionView.frame.width - 32) / 4 - 2
            return CGSize(width: width, height: width * 1.1)
            
        // 카트 컬렉션 뷰 크기 설정
        case cartCollectionView:
            let width = (collectionView.frame.width - 32) / 5 - 1
            return CGSize(width: width, height: width * 0.7)
        default: return .zero
        }
    }
}

extension SelectMenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 보여줄 셀의 갯수
        switch collectionView {
        case mealKitCollectionView:
            return mealKitList.count
        case cartCollectionView:
            return cartList.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // collectionView에 보여줄 데이터
        switch collectionView {
        case mealKitCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealKitCell", for: indexPath) as! MealKitCollectionViewCell
            cell.bind(mealKit: mealKitList[indexPath.row])
            cell.toppingSelectedButtonTapped = {  }
            return cell
        case cartCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCell", for: indexPath) as! CartCollectionViewCell
            cell.bind(cartItem: cartList[indexPath.row])
            return cell
        default: return .init()
        }
    }
}

fileprivate extension SelectMenuViewController {
    
    func setUI() {
        self.title = "밀키트"
        navigationController?.navigationBar.tintColor = .highlight
        navigationController?.navigationBar.backgroundColor = .sub
        // 네비게이션바 LargeTitle 설정
        navigationController?.navigationBar.prefersLargeTitles = true
        
        mealKitCollectionView = {
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.minimumLineSpacing = 14
            //flowLayout.minimumInteritemSpacing = 2
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
            view.backgroundColor = .sub
            view.layer.cornerRadius = 8
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        cartCountTitleLabel = {
            let label = UILabel()
            label.text = "장바구니"
            label.font = .systemFont(ofSize: 20, weight: .bold)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        cartCountLabel = {
            let label = UILabel()
            label.text = " 5개 "
            label.font = .systemFont(ofSize: 18, weight: .semibold)
            label.textColor = .white
            label.backgroundColor = .highlight
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        totalPriceTitleLabel = {
            let label = UILabel()
            label.text = "총 주문금액"
            label.font = .systemFont(ofSize: 18, weight: .semibold)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        totalPriceLabel = {
            let label = UILabel()
            label.text = "20,000원"
            label.font = .systemFont(ofSize: 20, weight: .bold)
            label.textColor = .highlight
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        cartCollectionView = {
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.minimumInteritemSpacing = 4
            flowLayout.scrollDirection = .horizontal
            collectionView.collectionViewLayout = flowLayout
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(CartCollectionViewCell.self, forCellWithReuseIdentifier: "CartCell")
            collectionView.backgroundColor = .clear
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            return collectionView
        }()
        
        orderButton = {
            let button = UIButton()
            button.setTitle("주문하기", for: .normal)
            button.backgroundColor = .highlight
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        [mealKitCollectionView, cartView, orderButton].forEach {
            view.addSubview($0)
        }
        
        [cartCountTitleLabel, cartCountLabel, totalPriceLabel, totalPriceTitleLabel, cartCollectionView].forEach {
            cartView.addSubview($0)
        }
    }
    
    func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            mealKitCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            mealKitCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            mealKitCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 14),
            mealKitCollectionView.bottomAnchor.constraint(equalTo: cartView.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cartView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            cartView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            cartView.bottomAnchor.constraint(equalTo: orderButton.topAnchor),
            cartView.heightAnchor.constraint(equalToConstant: 240),
            
            cartCountTitleLabel.leadingAnchor.constraint(equalTo: cartView.leadingAnchor, constant: 24),
            cartCountTitleLabel.bottomAnchor.constraint(equalTo: cartCollectionView.topAnchor, constant: -2),
            
            cartCountLabel.leadingAnchor.constraint(equalTo: cartCountTitleLabel.trailingAnchor, constant: 8),
            cartCountLabel.bottomAnchor.constraint(equalTo: cartCollectionView.topAnchor, constant: -2),
            
            totalPriceTitleLabel.trailingAnchor.constraint(equalTo: totalPriceLabel.leadingAnchor, constant: -8),
            totalPriceTitleLabel.bottomAnchor.constraint(equalTo: cartCollectionView.topAnchor, constant: -2),
            
            totalPriceLabel.trailingAnchor.constraint(equalTo: cartView.trailingAnchor, constant: -48),
            totalPriceLabel.bottomAnchor.constraint(equalTo: cartCollectionView.topAnchor, constant: -2),
            
            cartCollectionView.leadingAnchor.constraint(equalTo: cartView.leadingAnchor),
            cartCollectionView.trailingAnchor.constraint(equalTo: cartView.trailingAnchor),
            cartCollectionView.bottomAnchor.constraint(equalTo: cartView.bottomAnchor),
            cartCollectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            orderButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            orderButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            orderButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            orderButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setAction() {
        orderButton.addTarget(self, action: #selector(tapOrderButton), for: .touchUpInside)
    }
}


#Preview(traits: .defaultLayout) {
    SelectMenuViewController()
}
