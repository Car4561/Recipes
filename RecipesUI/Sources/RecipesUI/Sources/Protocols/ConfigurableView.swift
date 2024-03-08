//
//  ConfigurableView.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 17/05/23.
//

public protocol ConfigurableView {

    associatedtype ConfigType
    func configure(with item: ConfigType)
}
