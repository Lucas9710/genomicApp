
import Foundation
import UIKit

class ControlPanelView : UIView{
    
    let animationStateChanged: StateAction
    let fondStateChanged : StateAction
    var controlAnimationSwitch : UIView!
    var isAnimationActive : Bool = false
    var isBackgroundChangeActive : Bool = false
    var isViewBackActive : Bool = true
    var viewBackState : StateAction
    var controlFondSwitch : UIView!
    var labelBackground: UILabel!
    var labelAnimation : UILabel!
    var viewBack : UIView!
    var labelViewBack: UILabel!
    
    internal init(animationStateChanged: @escaping StateAction, fondStateChanged: @escaping StateAction, viewBackState : @escaping StateAction ){
        self.animationStateChanged = animationStateChanged
        self.fondStateChanged = fondStateChanged
        self.viewBackState = viewBackState
        super.init(frame: .zero)
        print("\(self): init")
        self.backgroundColor = .purple
        createAnimationSwitch()
        createFondSwitch()
        createViewBack()
        createLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func executeAnimationChanged() {
        print("\(self): execute animation changed")
        isAnimationActive = !isAnimationActive
        
        self.animationStateChanged(isAnimationActive)
        controlAnimationSwitch.backgroundColor = isAnimationActive ? .green : .red
        
        
        
        
    }
    
    @objc func executeBackgroundChanged(){
        isBackgroundChangeActive = !isBackgroundChangeActive
        
        self.fondStateChanged(isBackgroundChangeActive)
        controlFondSwitch.backgroundColor = isBackgroundChangeActive ? .green : .red
        
     
    }
    @objc func executeViewBack(){
        isViewBackActive = !isViewBackActive
        viewBack.backgroundColor = isViewBackActive ? .green : .red
        self.viewBackState(isViewBackActive)
    }
    
    func turnOffViewBack() {
        isViewBackActive = false
        viewBack.backgroundColor = .red
    }
    
    func createAnimationSwitch(){
        
        controlAnimationSwitch = UIView()
        
        controlAnimationSwitch.backgroundColor = .red
        addSubview(controlAnimationSwitch)
        
        controlAnimationSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        controlAnimationSwitch.widthAnchor.constraint(equalToConstant: 50 ).isActive = true
        controlAnimationSwitch.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        controlAnimationSwitch.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -100).isActive = true
        controlAnimationSwitch.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(executeAnimationChanged))
        controlAnimationSwitch.addGestureRecognizer(gesture)
        
    }
    
    func createFondSwitch(){
        
        controlFondSwitch = UIView()
        
        controlFondSwitch.backgroundColor = .red
        addSubview(controlFondSwitch)
        controlFondSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        controlFondSwitch.widthAnchor.constraint(equalToConstant: 50).isActive = true
        controlFondSwitch.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        controlFondSwitch.centerXAnchor.constraint(equalTo: controlAnimationSwitch.centerXAnchor).isActive = true
        controlFondSwitch.topAnchor.constraint(equalTo: controlAnimationSwitch.bottomAnchor, constant: 10).isActive = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(executeBackgroundChanged))
        controlFondSwitch.addGestureRecognizer(gesture)
       
    }
    
    func createViewBack(){
        viewBack = UIView()
        
        viewBack.backgroundColor = .green
        addSubview(viewBack)
        
        viewBack.translatesAutoresizingMaskIntoConstraints = false
        
        viewBack.widthAnchor.constraint(equalToConstant: 50).isActive = true
        viewBack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        viewBack.centerXAnchor.constraint(equalTo:controlFondSwitch.centerXAnchor).isActive = true
        viewBack.bottomAnchor.constraint(equalTo: controlAnimationSwitch.topAnchor, constant: -10).isActive = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(executeViewBack))
        viewBack.addGestureRecognizer(gesture)
    }
    
    func createLabel(){
        
        labelAnimation = UILabel()
        labelBackground = UILabel()
        labelViewBack = UILabel()
        addSubview(labelAnimation)
        addSubview(labelBackground)
        addSubview(labelViewBack)
        
        labelAnimation.text = "Control animation change"
        labelAnimation.font = .systemFont(ofSize: 20)
        labelAnimation.textColor = .white
        labelAnimation.translatesAutoresizingMaskIntoConstraints = false
        
        labelBackground.text = "Control background color"
        labelBackground.font = .systemFont(ofSize: 20)
        labelBackground.textColor = .white
        labelBackground.translatesAutoresizingMaskIntoConstraints = false
        
        labelViewBack.text = "Back to menu"
        labelViewBack.font = .systemFont(ofSize: 20)
        labelViewBack.textColor = .white
        labelViewBack.translatesAutoresizingMaskIntoConstraints = false
       
        labelAnimation.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelAnimation.centerXAnchor.constraint(equalTo: controlAnimationSwitch.centerXAnchor, constant: -150).isActive = true
        labelAnimation.centerYAnchor.constraint(equalTo: controlAnimationSwitch.centerYAnchor).isActive = true
     
        
        labelBackground.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelBackground.centerXAnchor.constraint(equalTo: controlFondSwitch.centerXAnchor, constant: -150).isActive = true
        labelBackground.centerYAnchor.constraint(equalTo: controlFondSwitch.centerYAnchor).isActive = true
        
        labelViewBack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelViewBack.centerXAnchor.constraint(equalTo: viewBack.centerXAnchor, constant: -150).isActive = true
        labelViewBack.centerYAnchor.constraint(equalTo: viewBack.centerYAnchor).isActive = true
        
        
        
    }

}
