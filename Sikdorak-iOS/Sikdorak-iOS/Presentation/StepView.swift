//
//  StepView.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/17/24.
//

import UIKit

enum Step {
    case selectMenu
    case selectTopping
    case payment
}

class StepView: UIView {
    
    var segmentControl = UISegmentedControl(items: ["메뉴 선택", "재료 선택", "결제하기"])
    
    var step: Step = .selectTopping {
        didSet {
            switch step {
            case .selectMenu:
                segmentControl.selectedSegmentIndex = 0
            case .selectTopping:
                segmentControl.selectedSegmentIndex = 1
            case .payment:
                segmentControl.selectedSegmentIndex = 2
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        segmentControl.selectedSegmentTintColor = .highlight
        segmentControl.isUserInteractionEnabled = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(segmentControl)
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            segmentControl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            segmentControl.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            segmentControl.topAnchor.constraint(equalTo: self.topAnchor),
            segmentControl.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}

#Preview(traits: .fixedLayout(width: 300, height: 60)) {
    let stepView = StepView()
    stepView.step = .selectMenu
    return stepView
}
