import Darwin
struct Sequence {
    
    internal init(nucleotideString: String, qualityString: String? = nil) {
        var tempNucleotides : [Nucleotide] = []
        
        for index in 0...nucleotideString.count - 1{
            let letter = nucleotideString[index..<index+1]
            let qualityLetter = String(qualityString![index..<index+1])
            var nucleotide: Nucleotide = .a
            switch letter {
            case "A":
                nucleotide = .a
            case "T":
                nucleotide = .t
            case "C":
                nucleotide = .c
            case "G":
                nucleotide = .g
            default:
                break
            }
            nucleotide.quality = FastaProcessor.getPercentageQuality(character: qualityLetter)
            tempNucleotides.append(nucleotide)
        }
        
        self.nucleotides = tempNucleotides
    }
    
    internal init(nucleotides: [Nucleotide]) {
        self.nucleotides = nucleotides
    }
    
    var nucleotides : [Nucleotide]
    //var percentege = GCpercentage()
    var count: Int { nucleotides.count }
    var text: String {
        var string : String = ""
        for index in 1...nucleotides.count {
            string += nucleotides[index - 1].letter.uppercased()
        }
        return string
    }
    
    var percentageText: String {
       
       let tipText: String = String(format: "%.2f", GCpercentage() )
       return "\(tipText)%"
    }
    
    static let sample1: Sequence = .init(nucleotides: [.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t])
    
    
    static let sample2: Sequence = .init(nucleotides: [.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c])
    
    static let sample3: Sequence = .init(nucleotides: [.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,])
    
    static let sample4: Sequence = .init(nucleotides: [.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t])
    
    static let sample5: Sequence = .init(nucleotides: [.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g])
    
    static let sample6: Sequence = .init(nucleotides: [.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c])
    
    func GCpercentage() -> Double {
        
        var letterGandC = Int()
        
        for index in 0...nucleotides.count - 1{
           
            var type = nucleotides[index].type
            switch type {
            case .c :
                letterGandC += 1
                break
            case .g :
                letterGandC += 1
                break
            default:
                break
            }
            
        }
        
        let count = Double(letterGandC) /  Double (nucleotides.count) * 100
        return count
        
    }
    
}
