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
    private var errorLabel = UILabel()
    
    // you can use delegate here
    var onDoneButtonTapped: ((String) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add subviews to cell's content view
        contentView.addSubview(textField)
        contentView.addSubview(doneButton)
        contentView.addSubview(errorLabel)
        
        // Configure text field
        textField.placeholder = "Enter new item"
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        
        // Configure done button
        doneButton.setTitle("Done", for: .normal)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        
        // Text field error label
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textColor = .systemRed
        errorLabel.isHidden = true
        
        // Add constraints
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            doneButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            doneButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            errorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 12)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func doneButtonTapped() {
        if let text = textField.text, !text.isEmpty {
            errorLabel.isHidden = true
            onDoneButtonTapped?(text)
            textField.text = nil
        } else {
            errorLabel.text = "Please enter some text"
            errorLabel.isHidden = false
        }
    }
    
}

extension NewItemTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let tf = textField.text, !tf.isEmpty {
            errorLabel.isHidden = true
        }
        return true
    }
}
