//
//  ActionView.swift
//  ResuableComponents
//
//  Created by Shravan Gudikadi on 11/27/21.
//

import Foundation
import UIKit

class ActionView: UIView {
    
    let viewModel: ActionViewModel?
    
    
    let imageWidthHeight: CGFloat = 40
    let nameTopOffset: CGFloat = 8
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.isAccessibilityElement = false
        return label
    }()
    
    lazy var iconView: UIImageView = {
        let iconView: UIImageView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.contentMode = .scaleAspectFit
        iconView.isAccessibilityElement = false
        return iconView
    }()
    
    public init(viewModel: ActionViewModel?) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addTapRecognizer()
        addSubview(iconView)
        addSubview(titleLabel)
        configureConstraints()
        configureData()
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.widthAnchor.constraint(equalToConstant: self.imageWidthHeight),
            iconView.heightAnchor.constraint(equalToConstant: self.imageWidthHeight)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: self.nameTopOffset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])
    }
    
    func configureData() {
        titleLabel.text = self.viewModel?.title
        iconView.contentMode = .scaleAspectFit
        guard let imageName = self.viewModel?.imageName, let image = UIImage(named: imageName) else {
            iconView.image = nil
            return
        }
        
        iconView.image = image
        if image.size.width < self.imageWidthHeight && image.size.height < self.imageWidthHeight {
            iconView.contentMode = .center
        }
    }
    
    func addTapRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapEvent(sender:)))
        self.addGestureRecognizer(tapRecognizer)
        self.isUserInteractionEnabled = true
    }
    @objc func didTapEvent(sender: UITapGestureRecognizer) {
        self.viewModel?.tapEventHandler?()
    }
}
