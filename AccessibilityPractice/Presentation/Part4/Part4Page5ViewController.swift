//
//  Part4Page5ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 2/2/25.
//

import Foundation
import UIKit
import PinLayout

class Part4Page5ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var timeRecordImageView = UIImageView()
    
    private var labelContainer = UIView()
    private let featureStrings: Array<String> = [
        "로그인 화면",
        "커스텀 토글 버튼",
        "메인 화면",
        "진행 중인 게임 리스트",
        "베팅 화면",
        "로그아웃 팝업",
        "..."
    ]
    private var featureLabels = Array<UILabel>()
    
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
        
        timeRecordImageView.image = UIImage(named: "SampleTimeRecord")
        timeRecordImageView.contentMode = .scaleAspectFit
        timeRecordImageView.layer.cornerRadius = 5.0
        timeRecordImageView.layer.borderWidth = 1.0
        timeRecordImageView.layer.borderColor = UIColor.white.cgColor
        timeRecordImageView.layer.masksToBounds = true
        innerContentView.addSubview(timeRecordImageView)
        
        innerContentView.addSubview(labelContainer)
        
        for idx in featureStrings.indices {
            let label = UILabel()
            label.text = featureStrings[idx]
            label.font = .systemFont(ofSize: 15)
            label.textColor = .white
            featureLabels.append(label)
            labelContainer.addSubview(label)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right(20).bottom(self.view.pin.safeArea).marginBottom(25)
        
        timeRecordImageView.pin.right().vCenter().width(180).aspectRatio()
        
        labelContainer.pin.before(of: timeRecordImageView).left().marginRight(30)
        for idx in featureLabels.indices {
            if idx == 0 {
                featureLabels[idx].pin.top().horizontally().sizeToFit(.width)
            }
            else {
                featureLabels[idx].pin.below(of: featureLabels[idx-1]).horizontally().marginTop(5).sizeToFit(.width)
            }
        }
        labelContainer.pin.wrapContent().left().vCenter()
    }
}
