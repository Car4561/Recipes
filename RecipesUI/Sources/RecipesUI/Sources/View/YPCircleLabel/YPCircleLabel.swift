//
//  YPCircleLabel.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 16/05/23.
//

import UIKit

final public class YPCircleLabel: UILabel {
    
    // MARK: - Init
    
    public init(size: CGFloat) {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
        self.textColor = UIColor.white
        self.textAlignment = .center
        self.font = YPFont.medium
        self.setSquareForm(with: size)
        self.layer.cornerRadius = size / 2
        self.layer.borderWidth = 3.0
        self.layer.masksToBounds = true
        self.layer.backgroundColor = YPColors.labelTertiary.cgColor
        self.layer.borderColor = YPColors.labelTertiary.cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
