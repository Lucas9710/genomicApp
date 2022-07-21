//
//  ControlOptionView.swift
//  GenomicApp
//
//  Created by Lucas on 20/07/2022.
//

import UIKit

class ControlOptionView: UIView {

    var label: UILabel!
    var viewBack: UIView!
    var text : String
    var isActive: Bool!
    var action: StateAction!
    var isViewBackActive = false
    
    internal init(action: @escaping StateAction, text: String) {
        self.action = action
        self.text = text
        super.init(frame: .zero)
        self.backgroundColor = .purple
        self.heightAnchor.constraint(equalToConstant: 64).isActive = true
        createViewBack()
        createLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func executeViewBack(){
        isViewBackActive = !isViewBackActive
        viewBack.backgroundColor = isViewBackActive ? .green : .red
        self.action(isViewBackActive)
    }
    
    func createViewBack(){
        viewBack = UIView()
        
        viewBack.backgroundColor = .green
        addSubview(viewBack)
        
        viewBack.translatesAutoresizingMaskIntoConstraints = false
        
        viewBack.widthAnchor.constraint(equalToConstant: 50).isActive = true
        viewBack.heightAnchor.constraint(equalToConstant: 25).isActive = true
        viewBack.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(executeViewBack))
        viewBack.addGestureRecognizer(gesture)
    }
    
    func createLabel(){
        label = UILabel()
        
        addSubview(label)
        label.text = text
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 36).isActive = true
        viewBack.leftAnchor.constraint(equalTo: label.rightAnchor, constant: 36).isActive = true
        label.centerYAnchor.constraint(equalTo: viewBack.centerYAnchor).isActive = true
        
    }
}
