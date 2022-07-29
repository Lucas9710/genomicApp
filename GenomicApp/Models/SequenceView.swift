import Foundation
import UIKit

class SequenceView : UIView{
    
    var nucleotides : [Nucleotide] { sequence.nucleotides }
    
    //un arreglo con las cajas de nucleotidos
    var nucleotideViews: [NucleotideView] = []
    
    //la lista de nucleotidos dentro del rango de vista
    var windowNucleotides: [Nucleotide] {
        getWindowNucleotides(for: self.range)
    }
    
    var nucleotideSpace : Double {
        5
    }
    
    let windowLenght = 30
    
    var nucleotideSize : Double {
        return UIScreen.main.bounds.width / Double(windowLenght) - nucleotideSpace
    }
    let sequence : Sequence
    var range: SequenceRange
    
    var isShowingQuality: Bool = false {
        didSet {
            nucleotideViews.forEach { nucleotideView in
                nucleotideView.isShowingQuality = isShowingQuality
            }
        }
    }
    
    internal init(sequence : Sequence, range: SequenceRange){
        self.range = range
        self.sequence = sequence
        super.init(frame: .zero)
        self.backgroundColor = .clear
        createBoxes()
    }
    
    func update(range: SequenceRange) {
        self.range = range
        
        if nucleotideViews.count > 0 {
            for index in 0...nucleotideViews.count-1 {
                let nucleotideView = nucleotideViews[index]
                let newNucleotide = windowNucleotides[index]
                nucleotideView.update(nucleotide: newNucleotide)
            }
        }
    }
    
    //retorna un array con los datos de la vista
    func getWindowNucleotides(for range: SequenceRange) -> [Nucleotide] {
        let windowNucleotides = nucleotides[range.startIndex...range.endIndex-1]
        return Array(windowNucleotides)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //metodo que crea las cajas con nucleotidos
    func createBoxes(){
        for index in 1...windowNucleotides.count {
            let distance = (Double(index) - 1/2) * (nucleotideSize + nucleotideSpace)
            let nucleotide = nucleotides[index-1]
            createBox(offset: distance, nucleotide: nucleotide)
            stopAnimating()
        }
    }
    
    func startAnimating() {
        for index in 0...nucleotideViews.count-1 {
            let nv = nucleotideViews[index]
            let delay = Double(index) * 0.5
            nv.startAnimation(delay: delay)
        }
    }
    
    func stopAnimating() {
        for index in 0...nucleotideViews.count-1 {
            let nv = nucleotideViews[index]
            nv.stopAnimation()
        }
    }
    
    //crea caja con nucleotido
    func createBox(offset: Double, nucleotide : Nucleotide) {
        let nucleotideBox = NucleotideView(nucleotide: nucleotide)
        
        //agrega la vista a la pantalla
        self.addSubview(nucleotideBox)
        
        //para poder modificar las contraints a mano
        nucleotideBox.translatesAutoresizingMaskIntoConstraints = false
        
        //definir el ancho y el alto de la caja
        nucleotideBox.widthAnchor.constraint(equalToConstant: nucleotideSize).isActive = true
        nucleotideBox.heightAnchor.constraint(equalToConstant: nucleotideSize).isActive = true
        
        //definir la posicion en la pantalla
        nucleotideBox.centerXAnchor.constraint(equalTo: self.leftAnchor, constant: offset).isActive = true
        nucleotideBox.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        //manda el nucleotido al final del array
        nucleotideViews.append(nucleotideBox)
    }
    
    //duda si esta funcion retorna boleano
    func animationChanged(isActive : Bool){
        isActive ? startAnimating() : stopAnimating()
    }
    
    
}

