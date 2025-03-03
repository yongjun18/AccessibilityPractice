//
//  ExCustomButton2.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 2/1/25.
//

import Foundation
import UIKit
import PinLayout

class ExCustomButton2: UIView {
    
    // MARK: - Properties
    
    private var imageName: String?
    private var imageView = UIImageView()
    
    private var isSelected = false {
        didSet {
            let imageNameSuffix = (isSelected ? ".fill" : "")
            imageView.image = UIImage(systemName: (imageName ?? "") + imageNameSuffix)
        }
    }
    
    // MARK: - Life Cycle
    
    init(titleString: String, imageName: String) {
        super.init(frame: .zero)
        self.imageName = imageName
        self.backgroundColor = .clear
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: imageName)
        self.addSubview(imageView)
        
        self.isAccessibilityElement = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTouched(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.pin.all(10)
    }
}

// MARK: - Private Extensions

private extension ExCustomButton2 {
    @objc func viewTouched(_ sender: UITapGestureRecognizer) {
        if let view = sender.view as? ExCustomButton2 {
            view.isSelected.toggle()
        }
    }
}
