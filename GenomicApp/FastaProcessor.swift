//
//  FastaProcessor.swift
//  GenomicApp
//
//  Created by Lucas on 21/07/2022.
//

import Foundation

class FastaProcessor {
    
    static func transform(fasta: String) -> [Sequence] {
        var sequences : [Sequence] = []
        let arreglo = fasta.components(separatedBy: "\n")
        for index in 0...arreglo.count - 1{
            let nucleotideString = arreglo[index]
            if nucleotideString.count > 0 {
            let extractedExpr = Sequence(nucleotideString: nucleotideString)
            let sequence = extractedExpr
            sequences.append(sequence)
            }
        }
        return sequences
    }
}
