import Foundation
import UIKit

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
    
    static func getQualityColor(percentage: Double) -> UIColor {
        let r: Double = getRed(percentage: percentage)
        let g: Double = getGreen(percentage: percentage) * 0.9
        let b: Double = 0.4
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    
    static func getRed(percentage: Double) -> Double {
        var red = 2 - 2 * percentage
        if red > 1 { red = 1 }
        if red < 0 { red = 0 }
        return red
    }
    
    static func getGreen(percentage: Double) -> Double {
        var green = 2 * percentage
        if green > 1 { green = 1 }
        if green < 0 { green = 0 }
        return green
    }

}
