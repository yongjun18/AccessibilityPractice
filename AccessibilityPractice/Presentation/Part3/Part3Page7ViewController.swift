//
//  Part3Page7ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/30/25.
//

import Foundation
import UIKit
import PinLayout

class Part3Page7ViewController: PresentationViewController {
    
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
    
    private var beforeButton1 = ExCustomButton3(titleString: "좋아요", imageName: "hand.thumbsup")
    private var beforeButton2 = ExCustomButton3(titleString: "싫어요", imageName: "hand.thumbsdown")
    private var beforeButton3 = ExCustomButton3(titleString: "알림", imageName: "bell")
    
    private var afterButton1 = ExCustomButton4(titleString: "좋아요", imageName: "hand.thumbsup")
    private var afterButton2 = ExCustomButton4(titleString: "싫어요", imageName: "hand.thumbsdown")
    private var afterButton3 = ExCustomButton4(titleString: "알림", imageName: "bell")
    
    private var propertyContainer = UIView()
    private var propertyLabel = UILabel()
    private var propertyDescLabel = UILabel()
    private var editorScrollView = UIScrollView()
    private var codeLabel = UILabel()
    
    private var isWillAppear = false
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "3. iOS 접근성 구현 방법(VoiceOver)"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "Accessibility 관련 속성 값"
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
        
        innerContentView.addSubview(propertyContainer)
        
        propertyLabel.text = "accessibilityTraits"
        propertyLabel.font = .systemFont(ofSize: 17)
        propertyLabel.textColor = .white
        propertyContainer.addSubview(propertyLabel)
        
        propertyDescLabel.text = "접근성 요소의 종류를 나타내는 값(button, image, link, searchField 등)."
        propertyDescLabel.font = .systemFont(ofSize: 14)
        propertyDescLabel.textColor = .white
        propertyDescLabel.numberOfLines = 3
        propertyContainer.addSubview(propertyDescLabel)
        
        editorScrollView.layer.cornerRadius = 5.0
        editorScrollView.layer.borderWidth = 1.0
        editorScrollView.layer.borderColor = UIColor.white.cgColor
        editorScrollView.layer.masksToBounds = true
        propertyContainer.addSubview(editorScrollView)
        
        codeLabel.text = """
self.isAccessibilityElement = true
self.accessibilityLabel = "좋아요"
self.accessibilityTraits = .button
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
        
        propertyContainer.pin.left().right(to: exampleContainer.edge.left).marginRight(30)
        propertyLabel.pin.top().horizontally().sizeToFit(.width)
        propertyDescLabel.pin.below(of: propertyLabel).horizontally().marginTop(10).sizeToFit(.width)
        editorScrollView.pin.below(of: propertyDescLabel).horizontally().height(120)
            .marginTop(10)
        propertyContainer.pin.wrapContent().left().vCenter()
        
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

private extension Part3Page7ViewController {
    func readyForAppearAnimation() {
        innerContentView.alpha = 0.0
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25).marginLeft(-10)
    }
}
