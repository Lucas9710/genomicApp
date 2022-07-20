import Foundation
import UIKit

class WindowsView : UIView {
    
    var leftConstraint : NSLayoutConstraint!
    var sequenceAmount: Int
    var widthConstraint : NSLayoutConstraint!
    
    let windowLenght = 30
    
    lazy var viewModel : WindowsViewModel = WindowsViewModel(windowLenght: windowLenght, totalSequenceLenght: sequenceAmount)
    
    internal init(sequenceAmount: Int){
        self.sequenceAmount = sequenceAmount
        super.init(frame: .zero)
        self.backgroundColor = .yellow
        createSlide()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func update(with percentage: Double) {
        let range = viewModel.getRange(percentage: percentage)
        leftConstraint.constant = range.startPercentage * self.bounds.width
        widthConstraint.constant = range.windowPercentage * self.bounds.width
    }
    
    func createSlide() {
        let view = UIView(frame: .zero)
        
        view.backgroundColor = .systemPink
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        leftConstraint = view.leftAnchor.constraint(equalTo: self.leftAnchor)
        leftConstraint.isActive = true
        
        widthConstraint = view.widthAnchor.constraint(equalToConstant: 10)
        widthConstraint.isActive = true
        
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        view.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
}
