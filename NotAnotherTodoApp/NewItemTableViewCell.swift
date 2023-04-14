//
//  NewItemTableViewCell.swift
//  NotAnotherTodoApp
//
//  Created by Tanin on 14/04/2023.
//

import UIKit

class NewItemTableViewCell: UITableViewCell {
    
    static let identifier: String = "new_todo_item_cell_identifier"
    
    var textField = UITextField()
    var doneButton = UIButton(type: .system)
    
    // you can use delegate here
    var onDoneButtonTapped: ((String) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add subviews to cell's content view
        contentView.addSubview(textField)
        contentView.addSubview(doneButton)
        
        // Configure text field
        textField.placeholder = "Enter new item"
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure done button
        doneButton.setTitle("Done", for: .normal)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        
        // Add constraints
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            doneButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            doneButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func doneButtonTapped() {
        if let text = textField.text, !text.isEmpty {
            onDoneButtonTapped?(text)
            textField.text = nil
        }
    }
    
}
