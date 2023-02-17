//
//  ViewController.swift
//  hwDateAndTime
//
//  Created by Anthony on 13.02.2023.
//

import UIKit

final class ViewController: UIViewController {

    private var label = UILabel()
    private var refreshButton = UIButton()
    private var holdTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSubview()
    }
    
    final func createSubview() {
        view.backgroundColor = .systemGray4
        title = "Current Date and Time"
        addLabel()
        addButton()
        createTimer()
    }
    
    //MARK: create label
    func addLabel() {
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
    
    func addButton() {
        refreshButton.setTitle("Refresh", for: .normal)
        refreshButton.setTitleColor(.systemBlue, for: .normal)
        refreshButton.setTitleColor(.black, for: .highlighted)
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.addTarget(self, action: #selector(refreshAction), for: .touchUpInside)
        view.addSubview(refreshButton)
        
        NSLayoutConstraint.activate([
            refreshButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16 * 3),
            refreshButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16 * 6),
            refreshButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16 * 6),
            refreshButton.heightAnchor.constraint(equalToConstant: 16 * 2)
        ])
    }
    
    //MARK: action
    @objc func refreshAction() {
        
        let sender = UIDatePicker()
        sender.date = .now
        
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.timeZone = .autoupdatingCurrent
        formatter.dateFormat = "d MMM yyyy г., h:mm:ss a"

        label.text = formatter.string(from: sender.date)
        holdTimer.invalidate()
        createTimer()
    }
}

//MARK: timer
extension ViewController {
    func createTimer() {
        holdTimer = Timer.scheduledTimer(timeInterval: 5,
                                         target: self,
                                         selector: #selector(counter),
                                         userInfo: nil,
                                         repeats: true)
    }

    @objc func counter() {
        refreshAction()
    }
}
