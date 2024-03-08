//
//  YPList.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 16/05/23.
//

import UIKit

final public class YPList: UIView {

    // MARK: - Properties

    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
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
    
    private func initializeView() {
        addSubview(stackView)
    }

    public func configure<View: UIView & ConfigurableView>(viewType: View.Type, with items: [View.ConfigType]) {
        stackView.pinToSuperview()

        for item in items {
            let view = View()
            view.configure(with: item)
            stackView.addArrangedSubview(view)
        }
    }

}
