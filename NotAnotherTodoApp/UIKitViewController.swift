//
//  UIKitViewController.swift
//  NotAnotherTodoApp
//
//  Created by Tanin on 12/04/2023.
//

import UIKit
import SnapKit

class UIKitViewController: UIViewController {
    
    private var todoItems: [String] = [
        "Use Accessibility Inspector"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        view.backgroundColor = .systemGray
        
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
            todoItemTableView
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.cornerRadius = 8.0
        tableView.layer.masksToBounds = true
        
        return tableView
    }()

}

extension UIKitViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoItemTableTableViewCell.identifier, for: indexPath) as! TodoItemTableTableViewCell
        cell.configure(todoItems[indexPath.item])
        cell.selectionStyle = .none
        return cell
    }
}
