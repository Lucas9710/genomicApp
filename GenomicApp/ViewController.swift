//
//  ViewController.swift
//  GenomicApp
//
//  Created by Lucas on 11/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var sequence: Sequence = .sample1
    
    //un arreglo con las cajas de nucleotidos
    var nucleotideViews: [NucleotideView] = []
    
    //la lista de nucleotidos dentro del rango de vista
    var windowNucleotides: [Nucleotide] = []
    
    var windowsView: WindowsView!
    
    var controlPanelView: ControlPanelView!
    
    var sequenceView: SequenceView!
    
    var sequences: [Sequence] = []
    
    var nucleotideSpace : Double {
        5
    }
    
    var nucleotideSize : Double {
        return self.view.bounds.width / Double(windowsView.windowLenght) - nucleotideSpace
    }
    
    var readView : ReadView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //let fastaFile = getFastaFile()
       let fastqFile = getFastqFile()
        //sequences = FastaProcessor.transformFasta(fasta: fastqFile)
        sequences = FastaProcessor.transformFastq(fastq: fastqFile)
        createWindowView()
        createControlPanelView()
        createSequenceView(mySequence: sequence)
        createReadView(sequences: sequences)
      
    }
    
    func getFastaFile() -> String {
        let urlPath = Bundle.main.url(forResource: "ch19_gene", withExtension: "fasta")!
        let data = try! Data(contentsOf: urlPath)
        let string = String(data: data, encoding: .utf8)!
        return string
    }
    
    func getFastqFile() -> String{
        let urlPath = Bundle.main.url(forResource: "archivo", withExtension: "fastq")!
        let data = try! Data(contentsOf: urlPath)
        let string = String(data: data, encoding: .utf8)!
        return string
    }
    
    func createWindowView() {
        //instancia un objeto de la clase WindowsView
        windowsView = WindowsView(sequenceAmount: sequence.nucleotides.count)
        
        //agrega la vista a la pantalla
        view.addSubview(windowsView)
        
        //Un valor booleano que determina si la máscara de tamaño automático de la vista se traduce en restricciones de diseño automático.
        windowsView.translatesAutoresizingMaskIntoConstraints = false
        
        //el ancho de la windowsview y el alto de la windowsview
        windowsView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        windowsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05 ).isActive = true
        
        //la posicion de la windowsview en la pantalla
        windowsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        windowsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    
    }
    
  
    
    //metodo para mover el pad
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let location = touch.location(in: self.view)
        let xposition = Double(location.x)
        
        let percentage = xposition / Double(view.bounds.width)
        self.windowsView.update(with: percentage)
        let range = windowsView.viewModel.getRange(percentage: percentage)
        self.sequenceView.update(range: range)
    }
    
    func createControlPanelView(){
        //instancia un objeto de la clase contronPanelView y le pasa por parametros si el boton de cambiar la animacion y el boton de cambiar el fondo
        controlPanelView = ControlPanelView(animationStateChanged: self.animationChanged(isActive:), fondStateChanged: self.fondChanged(isActive:), viewBackState: viewBackState(isActive:), backToSequenceState: backToSequence(isActive:))
        //agrega la vista a la pantalla
        view.addSubview(controlPanelView)
        //Un valor booleano que determina si la máscara de tamaño automático de la vista se traduce en restricciones de diseño automático.
        controlPanelView.translatesAutoresizingMaskIntoConstraints = false
        
        controlPanelView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        controlPanelView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        controlPanelView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        controlPanelView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        controlPanelView.showReadViewOptions()
    }
    
    func animationChanged(isActive : Bool){
        sequenceView.animationChanged(isActive: isActive)
    }
    
    func fondChanged(isActive: Bool){
        self.view.backgroundColor = isActive ? .black :  .white
    }
    
    func backToSequence(isActive: Bool){
        readView.removeFromSuperview()
        controlPanelView.showNucleotideViewOptions()
        windowsView.isHidden = false
    }
    
    func viewBackState(isActive: Bool){
        view.bringSubviewToFront(readView)
        
        if isActive {
            //show menu
            self.view.sendSubviewToBack(sequenceView)
            createReadView(sequences: sequences)
            controlPanelView.showReadViewOptions()
            
        } else {
            //show nucleotide view
            readView.removeFromSuperview()
            controlPanelView.showNucleotideViewOptions()
        }
    
    }
    
    func changedView(isActive: Bool){
        view.bringSubviewToFront(controlPanelView)
    }
    
    func sequenceChanged(sequence : Sequence){
        self.updateSequence(newSequence: sequence)
        controlPanelView.showNucleotideViewOptions()
    }
    

    func createSequenceView(mySequence : Sequence){
       
        let range = windowsView.viewModel.getRange(percentage: 0)
        sequenceView = SequenceView(sequence: mySequence, range: range)
        
        view.addSubview(sequenceView)
        
        sequenceView.translatesAutoresizingMaskIntoConstraints = false
     
        
        sequenceView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        sequenceView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        sequenceView.topAnchor.constraint(equalTo: controlPanelView.bottomAnchor).isActive = true
        sequenceView.bottomAnchor.constraint(equalTo: windowsView.topAnchor, constant: -28).isActive = true
        
    }
    
    func updateSequence(newSequence : Sequence){
        
        self.sequence = newSequence
        
        sequenceView.removeFromSuperview()
        windowsView.removeFromSuperview()
        
        createWindowView()
        createSequenceView(mySequence : newSequence)
    }
    
    func createReadView(sequences: [Sequence]){
        windowsView.isHidden = true
       
        readView = ReadView(sequences: sequences, sequenceUpdate: sequenceChanged(sequence:))
        
        view.addSubview(readView)
        
        readView.translatesAutoresizingMaskIntoConstraints = false
        
        
        readView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        readView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        readView.topAnchor.constraint(equalTo: controlPanelView.bottomAnchor).isActive = true
        readView.bottomAnchor.constraint(equalTo: windowsView.topAnchor, constant: -28).isActive = true
        
        
    }
    
    
}
