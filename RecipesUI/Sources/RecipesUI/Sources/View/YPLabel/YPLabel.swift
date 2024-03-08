//
//  YPLabel.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 16/05/23.
//

import UIKit

public protocol YPLabelItem {
    
    var titleLabel: String { get }
}


final public class YPLabel: UILabel {
    
    var insets = UIEdgeInsets.zero

    public override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }

    // MARK: Init
    
    public func padding(_ top: CGFloat = 8, _ bottom: CGFloat = 8, _ left: CGFloat = 0, _ right: CGFloat = 0) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeView()
    }

    // MARK: Functions

    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }

    private func initializeView() {
        font = YPFont.medium17
        numberOfLines = 0
        padding()
    }

}

// MARK: ConfigurableView

extension YPLabel: ConfigurableView {

    public typealias ConfigType = YPLabelItem
    
    public func configure(with item: YPLabelItem) {
        text = item.titleLabel
    }
}


