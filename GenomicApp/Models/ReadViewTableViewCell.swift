import UIKit

class ReadViewTableViewCell: UITableViewCell {
    
   var label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLabel() {
        self.addSubview(label)
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    }
    
    
    func updateLabel(text : String) {
        label.text = text
    }

    func setUp(row: Int) {
        for index in 0...row{
            
            switch(index){
            case 0:
                self.backgroundColor = .blue
            
                
                break
            case 1:
                self.backgroundColor = .red
              
                break
            case 2:
                self.backgroundColor = .orange
              
            default:
                self.backgroundColor = .black
          
            
            }
        }
    }
}
