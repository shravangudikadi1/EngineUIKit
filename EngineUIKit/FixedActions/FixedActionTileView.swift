//
//  FixedActionTileView.swift
//  ResuableComponents
//
//  Created by Shravan Gudikadi on 11/27/21.
//

import Foundation
import UIKit

public class FixedActionTileView: UIView {
    
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    struct Configuration {
        let subViewModels: [ActionViewModel]?
        static let uninitalized = Configuration(subViewModels: nil)
    }
    
    public var ViewModel: FixedActionTileViewModel? {
        didSet {
            guard let VM = ViewModel else { return }
            configureViews(VM: VM)
            
        }
        
    }
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews() {
        addSubview(mainStackView)
        mainStackView.pin(to: self)
    }
    
    func configureViews(VM: FixedActionTileViewModel) {
        if let configuration = VM.config {
            configureItemViews(with: configuration)
            
        }
    }
    
    func configureItemViews(with configuration: Configuration) {
       
       // mainStackView.removeFromSuperview()
        configuration.subViewModels?.forEach({ (item) in
            let view = ActionView(viewModel: item)
            mainStackView.addArrangedSubview(view)
        })
        
    }
    
}
