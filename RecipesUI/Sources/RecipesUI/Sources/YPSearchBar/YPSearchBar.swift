//
//  File.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 15/05/23.
//

import UIKit

public protocol YPSearchBarDelegate: AnyObject {
    
    func searchBarTextFieldDidChange(_ searchBar: YPSearchBar)
    func searchBarTextDidBeginEditing(_ searchBar: YPSearchBar)
    func searchBarSearchButtonClicked(_ searchBar: YPSearchBar)
    func searchBarCancelButtonClicked(_ searchBar: YPSearchBar)
}

public class YPSearchBar: UISearchBar {
    
    // MARK: Properties
    
    /// The search bar’s custom delegate object.
    public weak var ypSearchBarDelegate: YPSearchBarDelegate?
    
    private var borderWidth: CGFloat = 2.0
    private var borderRadius: CGFloat = 15.0
    
    public var textFont: UIFont = YPFont.semiBold15
    public var regex: String?
    
    public var isFiltering: Bool {
        guard let text = text else {
            return false
        }
        
        return !text.isEmpty
    }
    
    
    // MARK: - Overrides
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAttributes()
        delegate = self
        searchTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setAttributes()
        delegate = self
        searchTextField.delegate = self
    }
    
    
    // MARK: Helper Methods

    func setAttributes() {
        tintColor = YPColors.buttonTertiary
        backgroundImage = UIImage()
        searchBarStyle = .prominent
        backgroundColor = YPColors.viewBackground2
        searchTextField.font = textFont
        searchTextField.tintColor = YPColors.textFieldTint
        searchTextField.textColor = YPColors.textFieldText
        searchTextField.clipsToBounds = true
        searchTextField.backgroundColor = YPColors.viewBackground1
        searchTextField.layer.borderWidth = borderWidth
        searchTextField.layer.cornerRadius = borderRadius
        searchTextField.layer.borderColor = YPColors.textFieldInactiveOutline.cgColor
        searchTextPositionAdjustment = UIOffset(horizontal: 5.0, vertical: 0.0)
        setPositionAdjustment(UIOffset(horizontal: 6.0, vertical: 0.0), for: .search)
        setPositionAdjustment(UIOffset(horizontal: -6.0, vertical: 0.0), for: .clear)
    }
}


// MARK: - UISearchBarDelegate

extension YPSearchBar: UISearchBarDelegate {
    
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        ypSearchBarDelegate?.searchBarTextFieldDidChange(self)
    }
    
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        ypSearchBarDelegate?.searchBarTextDidBeginEditing(self)
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        ypSearchBarDelegate?.searchBarCancelButtonClicked(self)
    }
    
    public func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if let regex = regex,
            let currentString = searchTextField.text,
            let swiftRange = Range(range, in: currentString) {
            let newString = currentString.replacingCharacters(in: swiftRange, with: text)
            
            return newString.isEmpty ? true : newString.isValid(regex: regex)
        }

        return true
    }
}


// MARK: - UITextFieldDelegate

extension YPSearchBar: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ypSearchBarDelegate?.searchBarSearchButtonClicked(self)
        
        return true
    }
}
