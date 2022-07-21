

import Foundation
import UIKit

struct Nucleotide{
    var type : NucleotideType
    
    static let a : Nucleotide = .init(type: .a)
    static let t : Nucleotide = .init(type: .t)
    static let g : Nucleotide = .init(type: .g)
    static let c : Nucleotide = .init(type: .c)
    
    var letter: String {
        switch self.type {
        case .a:
            return "A"
        case .t:
            return "T"
        case .g:
            return "G"
        case .c:
            return "C"
        }
    }
    var color: UIColor{
        switch self.type{
        case .a :
            return .red
        case .t :
            return .blue
        case .g :
            return .orange
        case .c :
            return .purple
        }
    }
    var complement : Nucleotide {
        return .init(type: type.complement)
    }
    
    enum NucleotideType {
        case a 
        case t
        case g
        case c
        
        var complement : NucleotideType{
            switch self {
            case .a:
                return .t
            case .t:
                return .a
            case .g:
                return .c
            case .c:
                return .g
         
            }
        }
    }
}
