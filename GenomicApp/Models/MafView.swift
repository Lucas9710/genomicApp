import Foundation
import UIKit

class MafView : UIView{
    
    var mafViewA : UIView!
    var mafViewT : UIView!
    var mafViewG : UIView!
    var mafViewC : UIView!
    
    internal init(){
        
        super.init(frame: .zero)
        self.backgroundColor = .orange
        createMafViewA()
        createMafViewT()
        createMafViewG()
        createMafViewC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createMafViewA(){
        
        mafViewA = UIView()
        
        addSubview(mafViewA)
        
        mafViewA.translatesAutoresizingMaskIntoConstraints = false
        mafViewA.backgroundColor = Nucleotide.a.color
        
        mafViewA.widthAnchor.constraint(equalToConstant: 24).isActive = true
        mafViewA.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        mafViewA.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mafViewA.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
    }
    
    func createMafViewT(){
        
        mafViewT = UIView()
        
        addSubview(mafViewT)
        
        mafViewT.translatesAutoresizingMaskIntoConstraints = false
        mafViewT.backgroundColor = Nucleotide.t.color
        
        mafViewT.widthAnchor.constraint(equalToConstant: 24).isActive = true
        mafViewT.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        mafViewT.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mafViewT.topAnchor.constraint(equalTo: mafViewA.bottomAnchor).isActive = true
    }
    
    func createMafViewG(){
        
        mafViewG = UIView()
        
        addSubview(mafViewG)
        
        mafViewG.translatesAutoresizingMaskIntoConstraints = false
        mafViewG.backgroundColor = Nucleotide.g.color
        
        mafViewG.widthAnchor.constraint(equalToConstant: 24).isActive = true
        mafViewG.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        mafViewG.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mafViewG.topAnchor.constraint(equalTo: mafViewT.bottomAnchor).isActive = true
        
    }
    
    func createMafViewC(){
        
        mafViewC = UIView()
        
        addSubview(mafViewC)
        
        mafViewC.translatesAutoresizingMaskIntoConstraints = false
        mafViewC.backgroundColor = Nucleotide.c.color
        
        mafViewC.widthAnchor.constraint(equalToConstant: 24).isActive = true
        mafViewC.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        mafViewC.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mafViewC.topAnchor.constraint(equalTo: mafViewG.bottomAnchor).isActive = true
        
    }
}


