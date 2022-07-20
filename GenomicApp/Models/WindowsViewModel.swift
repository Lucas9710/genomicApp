import Foundation

class WindowsViewModel{
    

    
    internal init(windowLenght: Int, totalSequenceLenght: Int) {
        self.windowLenght = windowLenght
        self.totalSequenceLenght = totalSequenceLenght
    }
    
    var windowLenght : Int
    var totalSequenceLenght : Int
    
    func getRange(percentage: Double) -> SequenceRange {
        
        var startIndex = Int(percentage * Double(totalSequenceLenght)) - windowLenght / 2
        
        if(startIndex < 0){
            startIndex = 0
        }
        
        var endIndex = Int(startIndex + windowLenght)
        
        
        if(endIndex > totalSequenceLenght ){
           
            endIndex = totalSequenceLenght
            startIndex = totalSequenceLenght - windowLenght
        }
       
        
      
        
        
        let sequenceRange = SequenceRange(startIndex: startIndex, endIndex: endIndex, sequenceLenght: totalSequenceLenght )
        return sequenceRange
    }
}


struct SequenceRange {
    let startIndex: Int
    let endIndex: Int
    let sequenceLenght : Int
    
    var startPercentage : Double {Double(startIndex) / Double(sequenceLenght)}
    var endPercentage : Double {Double(endIndex) / Double (sequenceLenght)}
    var windowPercentage : Double {endPercentage - startPercentage}
    
    
}
