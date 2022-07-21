import Foundation
import UIKit

class ReadView: UIView {
    
    var tableView : UITableView!
    var sequences : [Sequence]
    var sequenceUpdate : SequenceUpdate
    
    internal init(sequences : [Sequence], sequenceUpdate : @escaping SequenceUpdate){
        self.sequences = sequences
        self.sequenceUpdate = sequenceUpdate
        super.init(frame: .zero)
        self.backgroundColor = .systemBrown
       
        createUItableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUItableView() {
        
        tableView = UITableView()
        
        tableView.register(ReadViewTableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray
        
        tableView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true

        tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
}
