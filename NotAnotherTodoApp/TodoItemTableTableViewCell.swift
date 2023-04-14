//
//  TodoItemTableTableViewCell.swift
//  NotAnotherTodoApp
//
//  Created by Tanin on 14/04/2023.
//

import UIKit
import SnapKit

class TodoItemTableTableViewCell: UITableViewCell {
    
    static let identifier: String = "todo_item_cell_identifier"
    
    var checkmarkButton: UIButton!
    var descriptionLabel: UILabel!
    
    func configure(_ description: String) {
        descriptionLabel.attributedText = nil
        descriptionLabel.text = description
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        checkmarkButton = UIButton(type: .system)
        checkmarkButton.setImage(UIImage(named: "icon-empty"), for: .normal)
        checkmarkButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        contentView.addSubview(checkmarkButton)
        
        checkmarkButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.height.width.equalTo(15)
        }

        descriptionLabel = UILabel()
        descriptionLabel.text = "Bla bla"
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(checkmarkButton.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped(sender: UIButton) {
        shouldStrikeThroughText(!checkmarkButton.isSelected)
    }
    
    func shouldStrikeThroughText(_ strikeThrough: Bool) {
        guard let text = descriptionLabel.text else {
            return
        }
        
        let attributeString =  NSMutableAttributedString(string: text)
        
        // checkmarkButton.isAccessibilityElement = false
        
        if strikeThrough {
//            descriptionLabel.accessibilityLabel = "Completed: \(text)"
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(text.startIndex..., in: text))
        }
//        else {
//            descriptionLabel.accessibilityLabel = "Uncompleted: \(text)"
//        }
        
        let buttonImage = strikeThrough ? UIImage(named: "icon-check") : UIImage(named: "icon-empty")
        checkmarkButton.setImage(buttonImage, for: .normal)
        descriptionLabel.attributedText = attributeString
    }
    
}
