import Foundation
import UIKit

class QualitySequenceView : UIView{
    
    var quality :  Double
    var viewQuality : UIView!
    var heightConstraint: NSLayoutConstraint!
    var widthConstraint: NSLayoutConstraint!
    
    internal init(quality: Double){
        self.quality = quality
        super.init(frame: .zero)
        shadeView()
        createQualitySequeceView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(quality: Double) {
        self.quality = quality
        heightConstraint.constant = quality * 100
    }
    
    func shadeView (){
        
        let shadeView = UIView()
        
        shadeView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        self.addSubview(shadeView)
        
        shadeView.translatesAutoresizingMaskIntoConstraints = false
        
        shadeView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        shadeView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        shadeView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        shadeView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
    }
    
    func createQualitySequeceView(){
        viewQuality = UIView()
        heightConstraint = viewQuality.heightAnchor.constraint(equalToConstant: 100)
        widthConstraint = viewQuality.widthAnchor.constraint(equalToConstant: 24)
        
        addSubview(viewQuality)
        
        viewQuality.translatesAutoresizingMaskIntoConstraints = false
        heightConstraint.constant = quality * 100
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        viewQuality.backgroundColor = .red
        
        viewQuality.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        viewQuality.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
    }
    
}
