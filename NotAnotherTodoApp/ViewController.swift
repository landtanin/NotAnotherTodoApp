//
//  ViewController.swift
//  NotAnotherTodoApp
//
//  Created by Tanin on 12/04/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var openUIKitScreenBtn: UIButton!
    @IBOutlet weak var openSwiftUIScreenBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openUIKitScreen(_ sender: Any) {
        let vc = UIKitViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func openSwiftUIScreen(_ sender: Any) {
    }
    
}

