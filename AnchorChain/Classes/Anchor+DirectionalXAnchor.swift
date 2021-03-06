//  Copyright (c) 2018 André Gillfrost
//  Licensed under the MIT license

import UIKit

public extension UIView {

    enum DirectionalXAnchor { case leading, trailing, centerX }

    /**
     Constrains an anchor to given anchor in given view.

     - Parameters:
       - anchor:        The directional horizontal anchor in the receiver.
       - otherAnchor:   The directional horizontal anchor to align with.
       - otherView:     The view to align with.
       - constant:      `0` by default.
       - priority:      `.required` by default.
       - isActive:      `true` by default.

     - Returns: The created constraint.
     */
    @discardableResult
    func anchor(_ anchor: DirectionalXAnchor,
                to otherAnchor: DirectionalXAnchor,
                of otherView: UIView,
                constant: CGFloat = 0,
                priority: UILayoutPriority = .required,
                isActive: Bool = true) -> NSLayoutConstraint {

        disableAutoresizing()

        return self.anchor(for: anchor)
            .constraint(equalTo: otherView.anchor(for: otherAnchor), constant: constant)
            .priority(priority)
            .isActive(isActive)
    }
}

private extension Anchorable {

    func anchor(for anchor: UIView.DirectionalXAnchor) -> NSLayoutXAxisAnchor {
        switch anchor {
        case .leading:
            return leadingAnchor
        case .trailing:
            return trailingAnchor
        case .centerX:
            return centerXAnchor
        }
    }
}
