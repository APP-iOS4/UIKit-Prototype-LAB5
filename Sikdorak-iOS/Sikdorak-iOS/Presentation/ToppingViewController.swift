//
//  ToppingViewController.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/17/24.
//

import UIKit

class ToppingViewController: BaseViewController {

    var toppingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    var totalPriceLabel = UILabel()
    var doneButton = UIButton()
    
    var mealKitInfo: MealKit = .init(
        jjigae: Jjigae(image: "", name: "", spicy: [], price: 0),
        topping: [],
        sari: [],
        likeCount: 0
    )
    
    var totalPrice: Int = 0 {
        didSet {
            totalPriceLabel.text = "\(totalPrice.formatted())원"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setAction()
    }
    
    @objc func tapDoneButton() {
        navigationController?.popViewController(animated: true)
    }

}


extension ToppingViewController: UICollectionViewDelegate { }

extension ToppingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 480)
        default:
            return CGSize(width: collectionView.frame.width, height: 60)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 32) / 4 - 1
        return CGSize(width: width, height: width * 1.1 + 16)
    }
    
}

extension ToppingViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 1: return mealKitInfo.topping.count
        case 2: return mealKitInfo.sari.count
        default: return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ToppingCell", for: indexPath) as! ToppingCollectionViewCell
        
        switch indexPath.section {
        case 1:
            cell.bind(topping: mealKitInfo.topping[indexPath.row])
            
            cell.countButtonAction = { [weak self] in
                guard let self = self else { return }
                
                let toppingPrices = self.mealKitInfo.topping.enumerated().map {
                    let toppingCell = collectionView.cellForItem(at: IndexPath(row: $0.offset, section: 1)) as! ToppingCollectionViewCell
                    return $0.element.price * toppingCell.toppingCount
                }
                
                let sariPrices = self.mealKitInfo.sari.enumerated().map {
                    let sariCell = collectionView.cellForItem(at: IndexPath(row: $0.offset, section: 2)) as! ToppingCollectionViewCell
                    return $0.element.price * sariCell.toppingCount
                }
                
                self.totalPrice = toppingPrices.reduce(0, +) + sariPrices.reduce(0, +) + self.mealKitInfo.jjigae.price
            }
        case 2:
            cell.bind(topping: mealKitInfo.sari[indexPath.row])
            
            cell.countButtonAction = { [weak self] in
                guard let self = self else { return }
                
                let toppingPrices = self.mealKitInfo.topping.enumerated().map {
                    let toppingCell = collectionView.cellForItem(at: IndexPath(row: $0.offset, section: 1)) as! ToppingCollectionViewCell
                    return $0.element.price * toppingCell.toppingCount
                }
                
                let sariPrices = self.mealKitInfo.sari.enumerated().map {
                    let sariCell = collectionView.cellForItem(at: IndexPath(row: $0.offset, section: 2)) as! ToppingCollectionViewCell
                    return $0.element.price * sariCell.toppingCount
                }
                
                self.totalPrice = toppingPrices.reduce(0, +) + sariPrices.reduce(0, +) + self.mealKitInfo.jjigae.price
            }
        default: break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ToppingHeader", for: indexPath) as! ToppingHeaderView
            headerView.bind(mealKitInfo)
            return headerView
        default:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ToppingTitleHeader", for: indexPath) as! ToppingTitleHeaderView
            var category = ""
            category = indexPath.section == 1 ? "토핑" : "사리"
            headerView.bind(category)
            return headerView
        }
    }
    
}

fileprivate extension ToppingViewController {
    
    func setUI() {
        self.title = "재료 선택"
        
        toppingCollectionView = {
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.minimumLineSpacing = 16
//            flowLayout.minimumInteritemSpacing = 2
            flowLayout.sectionInset = .init(top: 0, left: 0, bottom: 32, right: 0)
            collectionView.collectionViewLayout = flowLayout
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(ToppingCollectionViewCell.self, forCellWithReuseIdentifier: "ToppingCell")
            collectionView.register(ToppingHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ToppingHeader")
            collectionView.register(ToppingTitleHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ToppingTitleHeader")
            collectionView.backgroundColor = .main
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            return collectionView
        }()
        
        totalPriceLabel = {
            let label = UILabel()
            label.text = "담은 금액: 10,000원   ."
            label.font = .systemFont(ofSize: 18, weight: .semibold)
            label.textAlignment = .right
            label.textColor = .black
            label.backgroundColor = .sub
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        doneButton = {
            let button = UIButton()
            button.setTitle("선택 완료", for: .normal)
            button.backgroundColor = .highlight
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        [toppingCollectionView, totalPriceLabel, doneButton].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            toppingCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            toppingCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            toppingCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            toppingCollectionView.bottomAnchor.constraint(equalTo: totalPriceLabel.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            totalPriceLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            totalPriceLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            totalPriceLabel.bottomAnchor.constraint(equalTo: doneButton.topAnchor),
            totalPriceLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            doneButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            doneButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            doneButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setAction() {
        doneButton.addTarget(self, action: #selector(tapDoneButton), for: .touchUpInside)
    }
    
}


#Preview(traits: .landscapeLeft) {
    let toppingViewController = ToppingViewController()
    toppingViewController.mealKitInfo = .mockData[0]
    return toppingViewController
}
