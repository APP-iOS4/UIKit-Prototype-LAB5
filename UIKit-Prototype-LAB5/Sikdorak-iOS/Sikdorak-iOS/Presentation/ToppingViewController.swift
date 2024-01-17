//
//  ToppingViewController.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/17/24.
//

import UIKit

class ToppingViewController: BaseViewController {

    var stepView = UIView()
    var toppingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    var totalPriceLabel = UILabel()
    var doneButton = UIButton()
    
    var mealKitInfo: MealKit = .init(
        jjigae: Jjigae(image: "", name: "", spicy: [], price: 0),
        topping: [],
        sari: []
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setAction()
    }
    


}


extension ToppingViewController: UICollectionViewDelegate {
    
}

extension ToppingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 32) / 4 - 1
        return CGSize(width: width, height: width)
    }
    
}

extension ToppingViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return mealKitInfo.topping.count
        case 1: return mealKitInfo.sari.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ToppingCell", for: indexPath) as! ToppingCollectionViewCell
        
        switch indexPath.section {
        case 0:
            cell.bind(topping: mealKitInfo.topping[indexPath.row])
        case 1:
            cell.bind(topping: mealKitInfo.sari[indexPath.row])
        default: break
        }
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        <#code#>
//    }
    
}

fileprivate extension ToppingViewController {
    
    func setUI() {
        self.title = "재료 선택"
        
        stepView = {
            let view = UIView()
            view.backgroundColor = .green
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
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
            collectionView.backgroundColor = .main
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            return collectionView
        }()
        
        totalPriceLabel = {
            let label = UILabel()
            label.text = "담은 금액: 0원"
            label.textAlignment = .right
            label.textColor = .white
            label.backgroundColor = .darkGray
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
        
        [stepView, toppingCollectionView, totalPriceLabel, doneButton].forEach {
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
            toppingCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            toppingCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            toppingCollectionView.topAnchor.constraint(equalTo: stepView.bottomAnchor, constant: 16),
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
            doneButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            doneButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setAction() {
        
    }
    
}


#Preview(traits: .landscapeLeft) {
    ToppingViewController()
}
