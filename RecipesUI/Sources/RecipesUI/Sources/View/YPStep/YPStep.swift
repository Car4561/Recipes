//
//  YPStep.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 16/05/23.
//

import UIKit

public protocol YPStepItem {
    
    var numberStep: String { get }
    var instructionStep: String { get }
}


final public class YPStep: UIView {

    // MARK: - Properties

    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 5
        view.alignment = .center
        view.layoutMargins = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        view.isLayoutMarginsRelativeArrangement = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var numberLabel: YPCircleLabel = {
        let label = YPCircleLabel(size: 32)
        label.numberOfLines = 0
        label.font = YPFont.medium17
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    private var instructionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = YPFont.medium17
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeView()
    }

    // MARK: - Functions

    private func initializeView() {
        addSubview(stackView)
        stackView.addArrangedSubviews(
            numberLabel,
            instructionLabel
        )
        stackView.pinToSuperview()
    }

}

extension YPStep: ConfigurableView {

    public typealias ConfigType = YPStepItem
    
    public func configure(with item: YPStepItem) {
        numberLabel.text = item.numberStep
        instructionLabel.text = item.instructionStep
    }
}
