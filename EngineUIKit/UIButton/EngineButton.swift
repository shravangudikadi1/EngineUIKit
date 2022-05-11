//
//  EngineButton.swift
//  EngineUIKit
//
//  Created by Shravan Gudikadi on 5/10/22.
//

import Foundation
import UIKit

public class EngineButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(frame: CGRect, title: String?, state: UIControl.State, font: UIFont?, color: UIColor?) {
        self.init(frame: frame)
        self.setTitle(title, for: state)
        self.titleLabel?.font = font
        self.backgroundColor = color
        
    }
    
}
