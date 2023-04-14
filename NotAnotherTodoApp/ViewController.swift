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
        
        // temp: just go direct to UIKit vc
        let vc = UIKitViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func openUIKitScreen(_ sender: Any) {
//        let vc = UIKitViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openSwiftUIScreen(_ sender: Any) {
    }
    
}

