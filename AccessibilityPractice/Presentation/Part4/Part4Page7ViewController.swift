//
//  Part4Page7ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 2/2/25.
//

import Foundation
import UIKit
import PinLayout

class Part4Page7ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var exampleContainer = UIView()
    private var beforeContainer = UIView()
    private var beforeLabel = UILabel()
    private var afterContainer = UIView()
    private var afterLabel = UILabel()
    
    private var beforeButton1 = ExCustomButton1(titleString: "좋아요", imageName: "hand.thumbsup")
    private var beforeButton2 = ExCustomButton1(titleString: "싫어요", imageName: "hand.thumbsdown")
    private var beforeButton3 = ExCustomButton1(titleString: "알림", imageName: "bell")
    
    private var afterButton1 = ExCustomButton(titleString: "좋아요", imageName: "hand.thumbsup")
    private var afterButton2 = ExCustomButton(titleString: "싫어요", imageName: "hand.thumbsdown")
    private var afterButton3 = ExCustomButton(titleString: "알림", imageName: "bell")
    
    private var featureContainer = UIView()
    private var featureLabel = UILabel()
    private var featureDescLabel = UILabel()
    private var editorScrollView = UIScrollView()
    private var codeLabel = UILabel()
    
    private var isWillAppear = false
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "4. 발표를 마치며"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "송년회 베팅 앱 VoiceOver 적용기"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        mainContentView.addSubview(innerContentView)
        
        innerContentView.addSubview(exampleContainer)
        
        beforeContainer.layer.cornerRadius = 5.0
        beforeContainer.layer.borderWidth = 1.0
        beforeContainer.layer.borderColor = UIColor.white.cgColor
        beforeContainer.layer.masksToBounds = true
        exampleContainer.addSubview(beforeContainer)
        
        beforeLabel.text = "Before"
        beforeLabel.textColor = .black
        beforeLabel.font = .systemFont(ofSize: 13)
        beforeLabel.backgroundColor = .white
        beforeLabel.textAlignment = .center
        beforeLabel.layer.cornerRadius = 3.0
        beforeLabel.layer.masksToBounds = true
        exampleContainer.addSubview(beforeLabel)
        
        afterContainer.layer.cornerRadius = 5.0
        afterContainer.layer.borderWidth = 1.0
        afterContainer.layer.borderColor = UIColor.white.cgColor
        afterContainer.layer.masksToBounds = true
        exampleContainer.addSubview(afterContainer)
        
        afterLabel.text = "After"
        afterLabel.textColor = .black
        afterLabel.font = .systemFont(ofSize: 13)
        afterLabel.backgroundColor = .white
        afterLabel.textAlignment = .center
        afterLabel.layer.cornerRadius = 3.0
        afterLabel.layer.masksToBounds = true
        exampleContainer.addSubview(afterLabel)
        
        beforeContainer.addSubview(beforeButton1)
        beforeContainer.addSubview(beforeButton2)
        beforeContainer.addSubview(beforeButton3)
        
        afterContainer.addSubview(afterButton1)
        afterContainer.addSubview(afterButton2)
        afterContainer.addSubview(afterButton3)
        
        innerContentView.addSubview(featureContainer)
        
        featureLabel.text = "커스텀 토글 버튼"
        featureLabel.font = .systemFont(ofSize: 17)
        featureLabel.textColor = .white
        featureContainer.addSubview(featureLabel)
        
        featureDescLabel.text = "프레임워크에서 제공하는 기본 기능만으로는 요구사항 구현이 어려울 경우, 레이아웃 및 기능을 커스텀 하여 구현"
        featureDescLabel.font = .systemFont(ofSize: 14)
        featureDescLabel.textColor = .white
        featureDescLabel.numberOfLines = 3
        featureContainer.addSubview(featureDescLabel)
        
        editorScrollView.layer.cornerRadius = 5.0
        editorScrollView.layer.borderWidth = 1.0
        editorScrollView.layer.borderColor = UIColor.white.cgColor
        editorScrollView.layer.masksToBounds = true
        featureContainer.addSubview(editorScrollView)
        
        codeLabel.text = """
self.isAccessibilityElement = true
self.accessibilityLabel = "좋아요"
self.accessibilityTraits = .button
self.accessibilityValue = "끔"
self.accessibilityHint = "끄거나 켜려면 이중 탭 하세요."
...
private var isSelected = false {
    didSet {
        self.accessibilityValue = (isSelected ? "켬" : "끔")
    }
}
"""
        codeLabel.font = .systemFont(ofSize: 14)
        codeLabel.textColor = .white
        codeLabel.numberOfLines = 0
        editorScrollView.addSubview(codeLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25)
        
        beforeContainer.pin.top().left().width(250).height(80)
        beforeLabel.pin.left(to: beforeContainer.edge.left).top(to: beforeContainer.edge.top)
            .width(60).height(24).marginLeft(8).marginTop(-12)
        
        afterContainer.pin.below(of: beforeContainer).left().width(250).height(80).marginTop(20)
        afterLabel.pin.left(to: afterContainer.edge.left).top(to: afterContainer.edge.top)
            .width(60).height(24).marginLeft(8).marginTop(-12)
        
        beforeButton2.pin.center().size(48)
        beforeButton1.pin.before(of: beforeButton2, aligned: .center).size(48).marginRight(10)
        beforeButton3.pin.after(of: beforeButton2, aligned: .center).size(48).marginLeft(10)
        
        afterButton2.pin.center().size(48)
        afterButton1.pin.before(of: afterButton2, aligned: .center).size(48).marginRight(10)
        afterButton3.pin.after(of: afterButton2, aligned: .center).size(48).marginLeft(10)
        
        exampleContainer.pin.wrapContent().right().vCenter()
        
        featureContainer.pin.left().right(to: exampleContainer.edge.left).marginRight(30)
        featureLabel.pin.top().horizontally().sizeToFit(.width)
        featureDescLabel.pin.below(of: featureLabel).horizontally().marginTop(10).sizeToFit(.width)
        editorScrollView.pin.below(of: featureDescLabel).horizontally().height(120)
            .marginTop(10)
        featureContainer.pin.wrapContent().left().vCenter()
        
        codeLabel.pin.top(12).horizontally(12).sizeToFit(.width)
        editorScrollView.contentSize = CGSize(width: editorScrollView.bounds.width,
                                              height: codeLabel.frame.maxY + 12)
        
        if isWillAppear {
            readyForAppearAnimation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        isWillAppear = true
        readyForAppearAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        isWillAppear = false
        UIView.animate(withDuration: 0.3) {
            self.innerContentView.alpha = 1.0
            self.innerContentView.pin.below(of: self.subtitleLabel, aligned: .left)
                .right().bottom(self.view.pin.safeArea).marginBottom(25)
        }
    }
}

// MARK: - Private Extensions

private extension Part4Page7ViewController {
    func readyForAppearAnimation() {
        innerContentView.alpha = 0.0
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25).marginLeft(-10)
    }
}
