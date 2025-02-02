//
//  ExCustomCell.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/31/25.
//

import Foundation
import UIKit
import PinLayout

class ExCustomCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "ExCustomCell"
    static let cellHeight = 45.0
    
    private var separatorView = UIView()
    public var label = UILabel()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .black
        
        separatorView.layer.borderColor = UIColor.white.cgColor
        separatorView.layer.borderWidth = 1
        self.contentView.addSubview(separatorView)
        
        label.textColor = .white
        self.contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        separatorView.pin.horizontally().vertically(1)
        label.pin.horizontally(10).vCenter().sizeToFit(.width)
    }
}
