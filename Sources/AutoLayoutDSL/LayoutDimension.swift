//
//  LayoutDimension.swift
//  
//
//  Created by Ian on 4/12/21.
//

#if canImport(UIKit)
import UIKit

extension NSLayoutDimension: LayoutDimension { }

public protocol LayoutDimension {
    func constraint(equalToConstant c: CGFloat) -> NSLayoutConstraint
    
    func constraint(equalTo anchor: Self,
                    multiplier m: CGFloat) -> NSLayoutConstraint
    
    func constraint(equalTo anchor: Self,
                    multiplier m: CGFloat,
                    constant c: CGFloat) -> NSLayoutConstraint
    
    func constraint(greaterThanOrEqualToConstant c: CGFloat) -> NSLayoutConstraint
    
    func constraint(greaterThanOrEqualTo anchor: Self,
                    multiplier m: CGFloat) -> NSLayoutConstraint
    
    func constraint(greaterThanOrEqualTo anchor: Self,
                    multiplier m: CGFloat,
                    constant c: CGFloat) -> NSLayoutConstraint
    
    func constraint(lessThanOrEqualToConstant c: CGFloat) -> NSLayoutConstraint
    
    func constraint(lessThanOrEqualTo anchor: Self,
                    multiplier m: CGFloat) -> NSLayoutConstraint
    
    func constraint(lessThanOrEqualTo anchor: Self,
                    multiplier m: CGFloat,
                    constant c: CGFloat) -> NSLayoutConstraint
}
#endif
