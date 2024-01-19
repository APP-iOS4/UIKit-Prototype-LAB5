//
//  PaymentCompleteViewController.swift
//  Sikdorak-iOS
//
//  Created by Seungjae Yu on 1/18/24.
//

import UIKit
import Lottie

class PaymentCompleteViewController: UIViewController {
    
    let fullScreenButton: UIButton = UIButton()
    var logoImageView: UIImageView = UIImageView()
    let completeMsgLabel: UILabel = UILabel()
    let orderNumberLabel: UILabel = UILabel()
    let orderNumberIntLabel: UILabel = UILabel()
    let timerlabel:UILabel = UILabel()
    var secondsRemaining = 10 // 10초 타이머 설정
    var timer: Timer?
    var animationView: LottieAnimationView!
    
    
//    let animationFrame: CGRect = .init(x: .zero, y: .zero, width: 300, height: 300)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = hexStringToUIColor(hex: "E4DCD4")
        
       
        lottiePlay()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.setLayout()
            self.startTimer()
            self.animationView.stop()
            self.animationView.isHidden = true
        })

    }
    
    override func viewDidAppear(_ animated: Bool) {
        completeMsgLabel.text = "주문이 완료 되었습니다."
        orderNumberLabel.text = "주문번호"
        orderNumberIntLabel.text = "77"
        timerlabel.text = ""
    }
    
    func lottiePlay() {
        let viewWidth: CGFloat = 350
        let viewHeight: CGFloat = 350

        // 가로 및 세로 가운데 정렬을 위한 CGRect 생성
        let animationFrame = CGRect(x: (UIScreen.main.bounds.width - viewWidth) / 2,
                                    y: (UIScreen.main.bounds.height - viewHeight) / 2,
                                    width: viewWidth,
                                    height: viewHeight)
        

        animationView = .init(name: "eggfry")
        animationView.frame = view.frame(forAlignmentRect: animationFrame)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        animationView.isHidden = false
        animationView.layer.opacity = 1
        view.addSubview(animationView)
        
        animationView.play()
    }
    
    func setLayout() {
        fullScreenButton.translatesAutoresizingMaskIntoConstraints = false
        fullScreenButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        
        
        let image = UIImage(named: "AppIconSquare")
        logoImageView = UIImageView(frame: CGRect(x: .zero, y: 10, width: 200, height: 200))
        logoImageView.contentMode = .center
        logoImageView.layer.opacity = 0.5
        logoImageView.image = image

        completeMsgLabel.textAlignment = .center
        completeMsgLabel.font = UIFont.boldSystemFont(ofSize: 80)
        completeMsgLabel.translatesAutoresizingMaskIntoConstraints = false
        
        orderNumberLabel.textAlignment = .center
        orderNumberLabel.font = UIFont.systemFont(ofSize: 40)
        orderNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        orderNumberIntLabel.textAlignment = .center
        orderNumberIntLabel.font = UIFont.boldSystemFont(ofSize: 120)
        orderNumberIntLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timerlabel.font = UIFont.systemFont(ofSize: 40)
        timerlabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fullScreenButton)
        view.addSubview(logoImageView)
        view.addSubview(completeMsgLabel)
        view.addSubview(orderNumberLabel)
        view.addSubview(orderNumberIntLabel)
        view.addSubview(timerlabel)
        
        
        NSLayoutConstraint.activate([
            fullScreenButton.topAnchor.constraint(equalTo: view.topAnchor),
            fullScreenButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fullScreenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fullScreenButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            completeMsgLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            completeMsgLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            orderNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orderNumberLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -380),
            orderNumberIntLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orderNumberIntLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            timerlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerlabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
        ])
    }
    
    deinit {
        stopTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
    }
    
    @objc func timerTick() {
        if secondsRemaining > 0 {
            updateTimerLabel()
            secondsRemaining -= 1
        } else {
            stopTimer()
            handleOrderCompletion()
        }
    }
    
    func updateTimerLabel() {
        let seconds = secondsRemaining % 60
        
        timerlabel.text = String(format: "첫화면으로 이동합니다(%d).", seconds)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func tapAction() {
        handleOrderCompletion()
    }
    
    func handleOrderCompletion() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    // MARK: - Additional

    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
}




#Preview(traits: .defaultLayout) {
    PaymentCompleteViewController()
}
