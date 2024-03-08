//
//  YPColors.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

import UIKit

public enum YPColors {
    
    // MARK: - NAME
    
    enum Name {
        
        static let buttonPrimary = "buttonPrimary"
        static let buttonSecondary = "buttonSecondary"
        static let buttonTertiary = "buttonTertiary"
        static let buttonQuaternary = "buttonQuaternary"
        static let buttonDisabled = "buttonDisabled"
        static let buttonLightContent = "buttonLightContent"
        
        
        static let grabberView = "grabberView"
        
        static let labelPrimary = "labelPrimary"
        static let labelSecondary = "labelSecondary"
        static let labelTertiary = "labelTertiary"
        static let labelQuaternary = "labelQuaternary"
        static let labelQuinary = "labelQuinary"
        static let labelLight = "labelLight"

        static let progressViewTrack = "progressViewTrack"
        
        static let textFieldText = "textFieldText"
        static let textFieldPlaceholder = "textFieldPlaceholder"
        static let textFieldTint = "textFieldTint"
        static let textFieldActivatedOutline = "textFieldActivatedOutline"
        static let textFieldFocusedOutline = "textFieldFocusedOutline"
        static let textFieldInactiveOutline = "textFieldInactiveOutline"
      

        static let tabBarTint = "tabBarTint"
        
        static let tintedNavigationBar = "tintedNavigationBar"
        static let tintedNavigationBarItem = "tintedNavigationBarItem"
        
        static let viewBackground1 = "viewBackground1"
        static let viewBackground2 = "viewBackground2"
    }
    
    
    // MARK: - COLORS

    public static let buttonPrimary = UIColor.loadColor(named: Name.buttonPrimary)
    
    public static let buttonSecondary = UIColor.loadColor(named: Name.buttonSecondary)
    
    public static let buttonTertiary = UIColor.loadColor(named: Name.buttonTertiary)
    
    public static let buttonQuaternary = UIColor.loadColor(named: Name.buttonQuaternary)
    
    public static let buttonDisabled = UIColor.loadColor(named: Name.buttonDisabled)
    
    public static let buttonLightContent = UIColor.loadColor(named: Name.buttonLightContent)

    public static let grabberView = UIColor.loadColor(named: Name.grabberView)
    
    public static let labelPrimary = UIColor.loadColor(named: Name.labelPrimary)
    
    public static let labelSecondary = UIColor.loadColor(named: Name.labelSecondary)
    
    public static let labelTertiary = UIColor.loadColor(named: Name.labelTertiary)
    
    public static let labelQuaternary = UIColor.loadColor(named: Name.labelQuaternary)
    
    public static let labelQuinary = UIColor.loadColor(named: Name.labelQuinary)
    
    public static let lightLabel = UIColor.loadColor(named: Name.labelLight)
    
    public static let progressViewTrack = UIColor.loadColor(named: Name.progressViewTrack)
    
    public static let textFieldText = UIColor.loadColor(named: Name.textFieldText)
    
    public static let textFieldPlaceholder = UIColor.loadColor(named: Name.textFieldPlaceholder)
    
    public static let textFieldTint = UIColor.loadColor(named: Name.textFieldTint)
    
    public static let textFieldActivatedOutline = UIColor.loadColor(named: Name.textFieldActivatedOutline)
    
    public static let textFieldFocusedOutline = UIColor.loadColor(named: Name.textFieldFocusedOutline)
    
    public static let textFieldInactiveOutline = UIColor.loadColor(named: Name.textFieldInactiveOutline)

    public static let tabBarTint = UIColor.loadColor(named: Name.tabBarTint)
    
    public static let tintedNavigationBar = UIColor.loadColor(named: Name.tintedNavigationBar)
    
    public static let tintedNavigationBarItem = UIColor.loadColor(named: Name.tintedNavigationBarItem)
    
    public static let viewBackground1 = UIColor.loadColor(named: Name.viewBackground1)
    
    public static let viewBackground2 = UIColor.loadColor(named: Name.viewBackground2)
}
