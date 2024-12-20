//
//  SideButtonView.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/18/24.
//

import Foundation
import UIKit
import PinLayout

class SideButtonView: UIButton {
    
    // MARK: - Properties
    
    private let bottomBorderView = UIView()
    
    // MARK: - Life Cycle
    
    init(image: UIImage?, tag: Int) {
        super.init(frame: .zero)
        setImage(image, for: .normal)
        self.tag = tag
        tintColor = .white
        
        bottomBorderView.backgroundColor = UIColor(named: "NetflixRed")
        bottomBorderView.alpha = 0.0
        addSubview(bottomBorderView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func layoutSubviews() {
        super.layoutSubviews()
        bottomBorderView.pin.bottom(12).width(20).height(3).hCenter()
    }
}

// MARK: - Extensions

extension SideButtonView {
    func setBottomBorderAlpha(value: CGFloat) {
        bottomBorderView.alpha = value
    }
}
