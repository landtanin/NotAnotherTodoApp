//
//  UIKitViewController.swift
//  NotAnotherTodoApp
//
//  Created by Tanin on 12/04/2023.
//

import UIKit
import SnapKit

class UIKitViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        view.backgroundColor = .systemTeal
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView)
            make.height.greaterThanOrEqualTo(scrollView.safeAreaLayoutGuide)
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
            headingLabel
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
        return label
    }()

}
