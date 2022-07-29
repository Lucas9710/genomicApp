
import Foundation
import UIKit

class ControlPanelView : UIView{
    
    let animationStateChanged: StateAction
    let fondStateChanged : StateAction
    var viewBackState : StateAction
    var backtoSequenceState : StateAction
    var hideQuality : StateAction
    var nucleotideQuality : NucleotideView!
    var hideQualityButton : UIView!
    
    let stackView = UIStackView()
    
    internal init(animationStateChanged: @escaping StateAction, fondStateChanged: @escaping StateAction, viewBackState : @escaping StateAction, backToSequenceState: @escaping StateAction, hideQuality : @escaping StateAction ){
        self.animationStateChanged = animationStateChanged
        self.fondStateChanged = fondStateChanged
        self.viewBackState = viewBackState
        self.backtoSequenceState = backToSequenceState
        self.hideQuality = hideQuality
       
        super.init(frame: .zero)
        print("\(self): init")
        self.backgroundColor = .purple
        createVerticalStackView()
    }
    
    func createVerticalStackView() {
        stackView.backgroundColor = .white
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        
        stackView.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    func showNucleotideViewOptions() {
        cleanOptions()
        createBackOption()
        createAnimationOption()
        createChangedBackground()
        createHideQualityButton()
        createSpacer()
    }
    
    func showReadViewOptions() {
        cleanOptions()
        createBackToSequence()
        createSpacer()
    }
    
    func cleanOptions(){
        stackView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
    
    func createBackOption(){
        let controlOptionView = ControlOptionView(action: viewBackState, text: "back to menu")
        stackView.addArrangedSubview(controlOptionView)
    }
    
    func createAnimationOption(){
        let controlOptionView = ControlOptionView(action: animationStateChanged, text: "animation changed", buttonInitialColor: .red)
        
        stackView.addArrangedSubview(controlOptionView)
    }
    
    func createChangedBackground(){
        let controlOpcionView = ControlOptionView(action: fondStateChanged, text: "changed background", buttonInitialColor: .red)
        stackView.addArrangedSubview(controlOpcionView)
    }
    
    func createBackToSequence(){
        let controlBackToSequence = ControlOptionView(action: backtoSequenceState, text: "back to seq")
        stackView.addArrangedSubview(controlBackToSequence)
    }
    
    func createSpacer(){
        stackView.addArrangedSubview(UIView())
    }
    
    func createHideQualityButton(){
      
      
        let controlBackToSequence = ControlOptionView(action: hideQuality, text: "hide quality", buttonInitialColor: .green)
        stackView.addArrangedSubview(controlBackToSequence)
        
        
        
       
      
    }
    
  
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

}
