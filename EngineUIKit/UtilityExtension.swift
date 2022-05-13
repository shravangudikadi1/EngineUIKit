//
//  UtilityExtension.swift
//  EngineUIKit
//
//  Created by Shravan Gudikadi on 5/13/22.
//

import Foundation
import UIKit

extension UIView {
    
    func pin(to superview: UIView, top: CGFloat = 0.0, bottom: CGFloat = 0.0, leading: CGFloat = 0.0, trailing: CGFloat = 0.0) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: top),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailing)

        ])
    }
}

extension UINib {
    func instantiateViewFromNib<T: UIView>(forType type: T.Type) -> T? {
        let bundle = Bundle.init(for: type)
        let nib = UINib(nibName: String(describing: type), bundle: bundle)
        let view = nib.instantiate(withOwner: nil, options: nil).first as? T
        return view
    }
}
