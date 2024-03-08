//
//  YPTabCollectionViewCell.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 15/05/23.
//

import UIKit

class YPTabCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = YPFont.medium
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var horizontalPadding: CGFloat = 16
    private var verticalPadding: CGFloat = 10
    
    
    // MARK: Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    // MARK: Overrides
    
    override var isSelected: Bool {
        didSet {
            setAppereanceFor(state: isSelected)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    // MARK: Helpers
    
    func configure(with item: YPTabItem) {
        titleLabel.text = item.title
    }
    
    private func configure() {
        layer.cornerRadius = 10
        layer.borderColor = YPColors.labelPrimary.withAlphaComponent(0.12).cgColor
        clipsToBounds = true
        
        addSubview(titleLabel)
        titleLabel.pinToSuperview(with: UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding))
        titleLabel.centerInParent()
        
        setAppereanceFor(state: false)
    }
    
    private func setAppereanceFor(state selected: Bool) {
        if selected {
            layer.borderWidth = 0.0
            titleLabel.textColor = YPColors.lightLabel
            backgroundColor = YPColors.tintedNavigationBar
        } else {
            layer.borderWidth = 2.0
            titleLabel.textColor = YPColors.labelQuaternary
            backgroundColor = YPColors.viewBackground1
        }
    }
}
