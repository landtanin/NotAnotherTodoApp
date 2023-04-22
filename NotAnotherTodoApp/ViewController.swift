//
//  ViewController.swift
//  NotAnotherTodoApp
//
//  Created by Tanin on 12/04/2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var openUIKitScreenBtn: UIButton!
    @IBOutlet weak var openSwiftUIScreenBtn: UIButton!

    @IBAction func openUIKitScreen(_ sender: Any) {
       let vc = UIKitViewController()
       navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openSwiftUIScreen(_ sender: Any) {
        let vc = UIHostingController(rootView: SwiftUIViewController())
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

