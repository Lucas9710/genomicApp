struct Sequence {
    var nucleotides : [Nucleotide]
    var count: Int { nucleotides.count }
    var text: String {
        var string : String = ""
        for index in 1...nucleotides.count {
            string += nucleotides[index - 1].letter.lowercased()
        }
        return string
    }
    
    static let sample1: Sequence = .init(nucleotides: [.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.a,.c,.t,.g,.c,.t,.a,.t,.t,.g,.c,.c,.t,.g,.g,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t,.g,.c,.a,.t])
    
    
    static let sample2: Sequence = .init(nucleotides: [.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c])
    
    static let sample3: Sequence = .init(nucleotides: [.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,.a,])
    
    static let sample4: Sequence = .init(nucleotides: [.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t,.t])
    
    static let sample5: Sequence = .init(nucleotides: [.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g,.g])
    
    static let sample6: Sequence = .init(nucleotides: [.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c,.c])
    
    
}
