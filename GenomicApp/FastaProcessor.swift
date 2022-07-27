//  FastaProcessor.swift
//  GenomicApp
//
//  Created by Lucas on 21/07/2022.
//

import Foundation

class FastaProcessor {
    
  
    static func transformFasta(fasta: String) -> [Sequence] {
        var sequences : [Sequence] = []
        
        let arreglo = fasta.components(separatedBy: "\n")
        for index in 0...arreglo.count - 1{
            let nucleotideString = arreglo[index]
            if nucleotideString.count > 0 && validateNucleotideSequence(sequence: nucleotideString){
                let sequence = Sequence(nucleotideString: nucleotideString)
                sequences.append(sequence)
            }
        }
        return sequences
    }
    
    static func transformFastq(fastq : String) -> [Sequence]{
        var sequences : [Sequence] = []
        
        let arreglo = fastq.components(separatedBy: "\n")
        
        for index in 0...arreglo.count - 1 {
            let nucleotideString = arreglo[index]
            let qualityString: String? = (index+2) < arreglo.count ? arreglo[index+2] : nil
            if nucleotideString.count > 0 && validateNucleotideSequence(sequence: nucleotideString) {
                let sequence = Sequence(nucleotideString: nucleotideString, qualityString: qualityString )
                sequences.append(sequence)
            }
            
            
        }
        
        return sequences
    }
    
    
    static func validateNucleotideSequence(sequence: String) -> Bool {
        for index in 0...sequence.count - 1 {
            let letter = sequence[index]
            if(letter != "A" && letter != "T" && letter != "G" && letter != "C" ){
                return false
            }
        }
        return true
    }
    
    static func getQuality(character: String) -> Int {
        let value = character.unicodeScalars[character.unicodeScalars.startIndex].value - 33
        return Int(value)
    }
    
    
    static func getPercentageQuality(character: String) -> Double {
        Double(getQuality(character: character)) / 40.0
    }

}
