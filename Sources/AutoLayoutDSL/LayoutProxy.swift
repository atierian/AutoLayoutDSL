//
//  LayoutProxy.swift
//  
//
//  Created by Ian on 4/12/21.
//

#if canImport(UIKit)
import UIKit

public class LayoutProxy {
    public lazy var leading = property(with: view.leadingAnchor)
    public lazy var trailing = property(with: view.trailingAnchor)
    public lazy var top = property(with: view.topAnchor)
    public lazy var bottom = property(with: view.bottomAnchor)
    public lazy var width = property(with: view.widthAnchor)
    public lazy var height = property(with: view.heightAnchor)
    public lazy var centerX = property(with: view.centerXAnchor)
    public lazy var centerY = property(with: view.centerYAnchor)
    
    private let view: UIView
    
    fileprivate init(view: UIView) {
        self.view = view
    }
    
    private func property<A: LayoutAnchor>(with anchor: A) -> LayoutProperty<A> {
        LayoutProperty(anchor: anchor)
    }
}

public struct LayoutProperty<Anchor: LayoutAnchor> {
    fileprivate let anchor: Anchor
}

extension LayoutProperty {
    func equal(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        anchor.constraint(equalTo: otherAnchor,
                          constant: constant).isActive = true
    }
    
    func greaterThanOrEqual(to otherAnchor: Anchor,
                            offsetBy constant: CGFloat = 0) {
        anchor.constraint(greaterThanOrEqualTo: otherAnchor,
                          constant: constant).isActive = true
    }
    
    func lessThanOrEqual(to otherAnchor: Anchor,
                         offsetBy constant: CGFloat = 0) {
        anchor.constraint(lessThanOrEqualTo: otherAnchor,
                          constant: constant).isActive = true
    }
}

extension LayoutProperty where Anchor: LayoutDimension {
    
    func equal(toConstant constant: CGFloat) {
        anchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func equal(to otherAnchor: Anchor, multiplier: CGFloat) {
        anchor.constraint(equalTo: otherAnchor,
                          multiplier: multiplier).isActive = true
    }
    
    func equal(to otherAnchor: Anchor,
               multiplier: CGFloat,
               constant: CGFloat) {
        anchor.constraint(equalTo: otherAnchor,
                          multiplier: multiplier,
                          constant: constant).isActive = true
    }
    
    func greaterThanOrEqual(toConstant constant: CGFloat) {
        anchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
    }
    
    func greaterThanOrEqual(toAnchor otherAnchor: Anchor,
                            multiplier: CGFloat) {
        anchor.constraint(greaterThanOrEqualTo: otherAnchor,
                          multiplier: multiplier).isActive = true
    }
    
    func greaterThanOrEqual(toAnchor otherAnchor: Anchor,
                            multiplier: CGFloat,
                            constant: CGFloat) {
        anchor.constraint(greaterThanOrEqualTo: otherAnchor,
                          multiplier: multiplier,
                          constant: constant).isActive = true
    }
    
    func lessThanOrEqual(toConstant constant: CGFloat) {
        anchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
    }
    
    func lessThanOrEqual(toAnchor otherAnchor: Anchor,
                         multiplier: CGFloat) {
        anchor.constraint(lessThanOrEqualTo: otherAnchor,
                          multiplier: multiplier).isActive = true
    }
    
    func lessThanOrEqual(toAnchor otherAnchor: Anchor,
                         multiplier: CGFloat,
                         constant: CGFloat) {
        anchor.constraint(lessThanOrEqualTo: otherAnchor,
                          multiplier: multiplier,
                          constant: constant).isActive = true
    }
}

extension UIView {
    public func layout(using closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: self))
    }
}

public func +<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    (lhs, rhs)
}

public func -<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    (lhs, -rhs)
}

public func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.1)
}

public func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}

public func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>,
                                rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

public func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}

public func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>,
                                rhs: (A, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

public func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.lessThanOrEqual(to: rhs)
}

public func *<A: LayoutDimension>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}

public func +<A: LayoutDimension>(lhs: (A, CGFloat), rhs: CGFloat) -> (A, CGFloat, CGFloat) {
    (lhs.0, lhs.1, rhs)
}

public func -<A: LayoutDimension>(lhs: (A, CGFloat), rhs: CGFloat) -> (A, CGFloat, CGFloat) {
    (lhs.0, lhs.1, -rhs)
}

public func ==<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.equal(toConstant: rhs)
}

public func ==<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.equal(to: rhs.0, multiplier: rhs.1)
}

public func ==<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: (A, CGFloat, CGFloat)) {
    lhs.equal(to: rhs.0, multiplier: rhs.1, constant: rhs.2)
}

public func <=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.lessThanOrEqual(toConstant: rhs)
}

public func <=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.lessThanOrEqual(toAnchor: rhs.0, multiplier: rhs.1)
}

public func <=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: (A, CGFloat, CGFloat)) {
    lhs.lessThanOrEqual(toAnchor: rhs.0, multiplier: rhs.1, constant: rhs.2)
}

public func >=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.greaterThanOrEqual(toConstant: rhs)
}

public func >=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(toAnchor: rhs.0, multiplier: rhs.1)
}

public func >=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: (A, CGFloat, CGFloat)) {
    lhs.greaterThanOrEqual(toAnchor: rhs.0, multiplier: rhs.1, constant: rhs.2)
}
#endif
