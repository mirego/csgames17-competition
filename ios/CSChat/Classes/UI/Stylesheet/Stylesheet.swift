//
//  Stylesheet.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

// MARK: Values
class Stylesheet
{
    // MARK: Durations
    static let minimumLoadingDuration: TimeInterval = 0.5

    // MARK: Dimensions
    static let spacing = 12.f
    static let margin = 16.f
    static let controlHeight = 53.f
}

// MARK: Colors
extension UIColor
{
    class var dustyOrange: UIColor
    {
        return UIColor(red: 229.0 / 255.0, green: 126.0 / 255.0, blue: 37.0 / 255.0, alpha: 1.0)
    }

    class var black: UIColor
    {
        return UIColor(white: 3.0 / 255.0, alpha: 1.0)
    }

    class var purpleyGrey: UIColor
    {
        return UIColor(red: 143.0 / 255.0, green: 142.0 / 255.0, blue: 148.0 / 255.0, alpha: 1.0)
    }

    class var pinkishGrey: UIColor
    {
        return UIColor(white: 197.0 / 255.0, alpha: 1.0)
    }

    class var white90: UIColor
    {
        return UIColor(white: 250.0 / 255.0, alpha: 0.9)
    }
}

// MARK: Fonts
extension UIFont
{
    // MARK: Constants
    struct UIFontStylesheet
    {
        // Cache
        static let Cache = NSCache<AnyObject, AnyObject>()
        
        // Font Names
        static let LatoBold = "Lato-Bold"
        static let LatoMedium = "Lato-Medium"
        static let LatoRegular = "Lato-Regular"
    }
    
    // PMARK: Custom Fonts
    class func latoBold(_ size: CGFloat) -> UIFont
    {
        return customFont(UIFontStylesheet.LatoBold, size: size)
    }

    class func latoMedium(_ size: CGFloat) -> UIFont
    {
        return customFont(UIFontStylesheet.LatoMedium, size: size)
    }

    class func latoRegular(_ size: CGFloat) -> UIFont
    {
        return customFont(UIFontStylesheet.LatoRegular, size: size)
    }
    
    // PMARK: Font Helpers
    class func customFont(_ name: String, size: CGFloat) -> UIFont
    {
        return customFont(name, size: size, cacheKey: "#\(name):\(size)" as AnyObject)
    }
    
    class func customFont(_ name: String, size: CGFloat, cacheKey: AnyObject) -> UIFont
    {
        if let font = UIFontStylesheet.Cache.object(forKey: cacheKey) as? UIFont
        {
            return font
        }
        
        let font = UIFont(name: name, size: size)!
        
        UIFontStylesheet.Cache.setObject(font, forKey: cacheKey)
        
        return font
    }
}
