//
//  UIKitViewController.swift
//  NotAnotherTodoApp
//
//  Created by Tanin on 12/04/2023.
//

import UIKit
import SnapKit

class UIKitViewController: UIViewController {

    var isAddingItem = false
    private var todoItems: [String] = [
        "Use Accessibility Inspector"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        view.backgroundColor = .systemBackground
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView)
            make.height.greaterThanOrEqualTo(scrollView.safeAreaLayoutGuide)
        }
        
        todoItemTableView.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(10)
        }
        
        addTaskButton.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(44)
            make.width.equalToSuperview().inset(10)
        }
    }
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.addSubview(stackView)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = true
        view.delaysContentTouches = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            headingLabel,
            todoItemTableView,
            addTaskButton
        ])
        view.alignment = .center
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 10
        return view
    }()
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.text = "To do"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    private lazy var todoItemTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(TodoItemTableTableViewCell.self, forCellReuseIdentifier: TodoItemTableTableViewCell.identifier)
        tableView.register(NewItemTableViewCell.self, forCellReuseIdentifier: NewItemTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.cornerRadius = 8.0
        tableView.layer.masksToBounds = true
        
        return tableView
    }()
    
    private lazy var addTaskButton: UIButton = {
        let button = UIButton()
//        button.accessibilityHint = ""
        button.setTitle("⨁ New task", for: .normal)
        button.layer.backgroundColor = UIColor.systemRed.cgColor
        button.layer.cornerRadius = 44 / 2
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.addTarget(self, action: #selector(addNewTask(_:)), for: .touchUpInside)
        return button
    }()

}

extension UIKitViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isAddingItem {
            return todoItems.count + 1
        } else {
            return todoItems.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == todoItems.count && isAddingItem {
            // Create the "add new item" cell
            let cell = tableView.dequeueReusableCell(withIdentifier: NewItemTableViewCell.identifier, for: indexPath)
            
            return cell
        } else {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: TodoItemTableTableViewCell.identifier, for: indexPath) as! TodoItemTableTableViewCell
            cell.configure(todoItems[indexPath.item])
            cell.selectionStyle = .none
            return cell
        }
    }
    
    @objc func addNewTask(_ sender: UIButton) {
        isAddingItem = true
        // Create a new index path for the new item cell
        let newItemIndexPath = IndexPath(row: todoItems.count, section: 0)
        
        // Insert a new row into the table view
        todoItemTableView.insertRows(at: [newItemIndexPath], with: .automatic)
        
        // Scroll to the new row
        todoItemTableView.scrollToRow(at: newItemIndexPath, at: .bottom, animated: true)

        // Insert a new item into the array
        todoItems.append("")
        
        // Set up the new item cell
        if let cell = todoItemTableView.cellForRow(at: newItemIndexPath) as? NewItemTableViewCell {
            
            cell.onDoneButtonTapped = { [weak self] text in
                self?.todoItems[newItemIndexPath.row] = text
                self?.isAddingItem = false
                self?.todoItemTableView.reloadRows(at: [newItemIndexPath], with: .automatic)
            }
            cell.textField.becomeFirstResponder()
        }
    }

}
