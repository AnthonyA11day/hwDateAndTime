//
//  ViewController.swift
//  hwDateAndTime
//
//  Created by Anthony on 13.02.2023.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createSubview()
    }
    
    final func createSubview() {
        view.backgroundColor = .systemGray4
        title = "Current Date and Time"
    }

}

