//
//  LayoutAnchor.swift
//  
//
//  Created by Ian on 4/12/21.
//

#if canImport(UIKit)
import UIKit

extension NSLayoutAnchor: LayoutAnchor { }

public protocol LayoutAnchor {
    func constraint(equalTo anchor: Self,
                    constant: CGFloat) -> NSLayoutConstraint
    
    func constraint(greaterThanOrEqualTo anchor: Self,
                    constant: CGFloat) -> NSLayoutConstraint
    
    func constraint(lessThanOrEqualTo anchor: Self,
                    constant: CGFloat) -> NSLayoutConstraint
}
#endif
