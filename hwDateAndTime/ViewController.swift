//
//  ViewController.swift
//  hwDateAndTime
//
//  Created by Anthony on 13.02.2023.
//

import UIKit

final class ViewController: UIViewController {

    private var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        createSubview()
    }
    
    final func createSubview() {
        view.backgroundColor = .systemGray4
        title = "Current Date and Time"
        addLabel()
    }
    
    //MARK: create label
    func addLabel() {
//        label.backgroundColor = .orange
        label.text = "10 февр. 2023 г., 11:45:54 AM"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 40)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            label.heightAnchor.constraint(equalToConstant: 16 * 2)
        ])
    }
    

}

