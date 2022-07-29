
import Foundation
import UIKit

class NucleotideView : UIView{
    
    var nucleotide : Nucleotide
    var complementaryLabel : UILabel!
    var label: UILabel!
    var complementaryBox : UIView!
    var box: UIView!
    var middleLine: UIView!
    var gradientLayer = CAGradientLayer()
    var isAnimating: Bool = false
    var mafView : MafView!
    var qualitySequenceView : QualitySequenceView!
    var isShowingQuality: Bool = false {
        didSet {
            qualitySequenceView.isHidden = !isShowingQuality
        }
    }
    
    internal init(nucleotide: Nucleotide) {
        self.nucleotide = nucleotide
        super.init(frame: .zero)
        addLabel()
        addLabelComplement()
        addBlackViews()
        addGesture()
        createMafview()
        createQualitySequeceView()
    }
    
    func update(nucleotide: Nucleotide){
        self.nucleotide = nucleotide
        self.label.text = nucleotide.letter
        self.label.backgroundColor = nucleotide.color

        self.complementaryLabel.text = nucleotide.complement.letter
        self.complementaryLabel.backgroundColor = nucleotide.complement.color.darker()
        
        self.qualitySequenceView.update(quality: nucleotide.quality)
    }
    
    func startAnimation(delay: Double = 0) {
        isAnimating = true
        self.animateUpBack(delay: delay)
    }
    
    func stopAnimation() {
        isAnimating = false
        self.bringSubviewToFront(label)
        self.label.layer.removeAllAnimations()
        self.complementaryLabel.layer.removeAllAnimations()
        self.box.layer.removeAllAnimations()
        self.complementaryBox.layer.removeAllAnimations()
            self.label.alpha = 1
            self.box.alpha = 1
            self.label.transform = .identity
            self.box.transform = .identity
            self.complementaryLabel.alpha = 0
            self.complementaryBox.alpha = 0
            self.complementaryLabel.transform = .identity
            self.complementaryBox.transform = .identity
    }
    
    func animateUpFront() {
        if !isAnimating {
            return
        }
        self.bringSubviewToFront(label)
        gradientLayer.colors = [nucleotide.complement.color.darker().cgColor, nucleotide.color.cgColor]
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: { () -> Void in
            self.label.alpha = 1
            self.label.transform = .identity.translatedBy(x: 0, y: 0).scaledBy(x: 1, y: 1)
            self.box.transform = .identity.translatedBy(x: 0, y: 0).scaledBy(x: 1, y: 1)
            self.complementaryLabel.alpha = 0.5
            self.complementaryLabel.transform = .identity.translatedBy(x: 0, y: 0).scaledBy(x: 0.7, y: 0.7)
            self.complementaryBox.transform = .identity.translatedBy(x: 0, y: 0).scaledBy(x: 0.7, y: 0.7)
//            self.middleLine.transform = .identity.scaledBy(x: 1, y: 0.2)
        }, completion: { (finished: Bool) -> Void in
            self.animateUpBack()
        })
    }
    
    func animateUpBack(delay: Double = 0) {
        if !isAnimating {
            return
        }
        gradientLayer.colors = [nucleotide.color.cgColor, nucleotide.complement.color.darker().cgColor]
        UIView.animate(withDuration: 2,
                       delay: delay,
                       options: [.curveEaseOut],
                       animations: { () -> Void in
            self.label.alpha = 1
            self.label.transform = .identity.translatedBy(x: 0, y: -40).scaledBy(x: 0.8, y: 0.8)
            self.box.transform = .identity.translatedBy(x: 0, y: -40).scaledBy(x: 0.8, y: 0.8)
            self.complementaryLabel.alpha = 1
            self.complementaryLabel.transform = .identity.translatedBy(x: 0, y: 40).scaledBy(x: 0.8, y: 0.8)
            self.complementaryBox.transform = .identity.translatedBy(x: 0, y: 40).scaledBy(x: 0.8, y: 0.8)
//            self.middleLine.transform = .identity.scaledBy(x: 1, y: 3)
        }, completion: { (finished: Bool) -> Void in
            self.animateDownBack()
        })
    }
    
    func animateDownBack() {
        if !isAnimating {
            return
        }
        gradientLayer.colors = [nucleotide.color.cgColor, nucleotide.complement.color.darker().cgColor]
        self.bringSubviewToFront(complementaryLabel)
        UIView.animate(withDuration: 2,
                        delay: 0.0,
                        options: [.curveEaseIn],
                        animations: { () -> Void in
            self.label.alpha = 0.5
            self.label.transform = .identity.translatedBy(x: 0, y: 0).scaledBy(x: 0.7, y: 0.7)
            self.box.transform = .identity.translatedBy(x: 0, y: 0).scaledBy(x: 0.7, y: 0.7)
            
            self.complementaryLabel.alpha = 1
            self.complementaryLabel.transform = .identity.translatedBy(x: 0, y: 0).scaledBy(x: 1, y: 1)
            self.complementaryBox.transform = .identity.translatedBy(x: 0, y: 0).scaledBy(x: 1, y: 1)
//            self.middleLine.transform = .identity.scaledBy(x: 1, y: 0.2)
            
        }, completion: { (finished: Bool) -> Void in
            self.animateDownFront()
        })
    }
    
    func animateDownFront() {
        if !isAnimating {
            return
        }
        gradientLayer.colors = [nucleotide.complement.color.darker().cgColor, nucleotide.color.cgColor]
        UIView.animate(withDuration: 2,
                        delay: 0.0,
                        options: [.curveEaseOut],
                        animations: { () -> Void in
            self.label.alpha = 1
            self.label.transform = .identity.translatedBy(x: 0, y: 40).scaledBy(x: 0.8, y: 0.8)
            self.box.transform = .identity.translatedBy(x: 0, y: 40).scaledBy(x: 0.8, y: 0.8)
            self.complementaryLabel.alpha = 1
            self.complementaryLabel.transform = .identity.translatedBy(x: 0, y: -40).scaledBy(x: 0.8, y: 0.8)
            self.complementaryBox.transform = .identity.translatedBy(x: 0, y: -40).scaledBy(x: 0.8, y: 0.8)
//            self.middleLine.transform = .identity.scaledBy(x: 1, y: 3)
        }, completion: { (finished: Bool) -> Void in
            self.animateUpFront()
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLabel(){
        label = UILabel()
        self.addSubview(label)
        label.text = nucleotide.letter.capitalized
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = nucleotide.color
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    func addLabelComplement(){
        let label = UILabel()
        self.addSubview(label)
        label.text = nucleotide.complement.letter
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        label.backgroundColor = nucleotide.complement.color.darker()
        label.textAlignment = .center
        
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.black.cgColor
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.complementaryLabel = label
    }
    
    func addBlackViews() {
        
        let blackView = UIView()
        blackView.backgroundColor = .black
        blackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(blackView)
        blackView.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        blackView.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        blackView.widthAnchor.constraint(equalTo: label.widthAnchor).isActive = true
        blackView.heightAnchor.constraint(equalTo: label.widthAnchor).isActive = true
        
        
        let blackView2 = UIView()
        blackView2.backgroundColor = .black
        blackView2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(blackView2)
        blackView2.centerXAnchor.constraint(equalTo: complementaryLabel.centerXAnchor).isActive = true
        blackView2.centerYAnchor.constraint(equalTo: complementaryLabel.centerYAnchor).isActive = true
        blackView2.widthAnchor.constraint(equalTo: complementaryLabel.widthAnchor).isActive = true
        blackView2.heightAnchor.constraint(equalTo: complementaryLabel.widthAnchor).isActive = true
        
        sendSubviewToBack(blackView)
        sendSubviewToBack(blackView2)
        
        
        box = blackView
        complementaryBox = blackView2
    }
    
    
    func addMiddleLine() {
        let blackView = UIView()
        blackView.backgroundColor = .black
        blackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(blackView)
        blackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        blackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        blackView.widthAnchor.constraint(equalToConstant: 2).isActive = true
        blackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        
        self.sendSubviewToBack(blackView)
        
        middleLine = blackView
    }

    func updateGradientBackground() {
        gradientLayer.colors = [nucleotide.color.cgColor, nucleotide.complement.color.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.middleLine.bounds
        self.middleLine.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func createMafview(){
       mafView = MafView()
        
      
        addSubview(mafView)
        mafView.translatesAutoresizingMaskIntoConstraints = false
        
        mafView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        mafView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        mafView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        mafView.topAnchor.constraint(equalTo: self.topAnchor, constant: 80).isActive = true
        mafView.isHidden = true
        
        
        
        
    }
    
    func createQualitySequeceView(){
        qualitySequenceView = QualitySequenceView(quality: nucleotide.quality)
       
         addSubview(qualitySequenceView)
         qualitySequenceView.translatesAutoresizingMaskIntoConstraints = false
         
        qualitySequenceView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
         qualitySequenceView.heightAnchor.constraint(equalToConstant: 100).isActive = true
         
         qualitySequenceView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        qualitySequenceView.topAnchor.constraint(equalTo: self.topAnchor, constant: -150).isActive = true
    }
    
    
//
//    @objc func showComplement(){
//
//        if !self.complementaryLabel.isHidden {
//            return
//        }
//
//        self.complementaryLabel.alpha = 1
//        self.complementaryLabel.isHidden = false
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
//            self?.hideComplement()
//        }
//    }
//
//    func hideComplement(){
//        UIView.animate(withDuration: 1,
//                       animations: {
//            self.complementaryLabel.alpha = 0
//        }, completion: { _ in
//            self.complementaryLabel.isHidden = true
//        })
//    }
//
    func addGesture(){
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(showComplement))
//        self.addGestureRecognizer(gesture)
    }
    
    
}
