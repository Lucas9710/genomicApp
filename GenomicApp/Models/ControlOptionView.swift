import UIKit

class ControlOptionView: UIView {

    var label: UILabel!
    var buttonAction: UIView!
    var text : String
    var isActive: Bool!
    var action: StateAction!
    var isActionActive = false
    var buttonInitialColor : UIColor
    
    internal init(action: @escaping StateAction, text: String, buttonInitialColor : UIColor = .white) {
        self.action = action
        self.text = text
        self.buttonInitialColor = buttonInitialColor
        super.init(frame: .zero)
        self.backgroundColor = .purple
        self.heightAnchor.constraint(equalToConstant: 64).isActive = true
      
        createButton()
        createLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func executeAction(){
        isActionActive = !isActionActive
        buttonAction.backgroundColor = isActionActive ? .green : .red
        self.action(isActionActive)
    }
    
    func createButton(){
        buttonAction = UIView()
        
        buttonAction.backgroundColor = buttonInitialColor
        addSubview(buttonAction)
        
        buttonAction.translatesAutoresizingMaskIntoConstraints = false
        
        buttonAction.widthAnchor.constraint(equalToConstant: 50).isActive = true
        buttonAction.heightAnchor.constraint(equalToConstant: 25).isActive = true
        buttonAction.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(executeAction))
        buttonAction.addGestureRecognizer(gesture)
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
        buttonAction.leftAnchor.constraint(equalTo: label.rightAnchor, constant: 36).isActive = true
        label.centerYAnchor.constraint(equalTo: buttonAction.centerYAnchor).isActive = true
        
    }
}
