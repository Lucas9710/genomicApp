import UIKit

class ReadViewTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var sequenceLabel = UILabel()
    var countLabel = UILabel()
    var IDlabel = UILabel()
    var stackView = UIStackView()
    var model: Sequence?
    var row : Int!
    var percentageFCLabel = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createStackView()
        self.createLabelID()
        self.addNameLabel()
        self.addSequenceLabel()
        self.addCountLabel()
        self.addPercentegeFC()
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addNameLabel() {
        stackView.addArrangedSubview(nameLabel)
        nameLabel.font = .boldSystemFont(ofSize: 16)
        nameLabel.textColor = .blue
    }
    
    
    
    func addSequenceLabel() {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Sequence:"
        subtitleLabel.font = .boldSystemFont(ofSize: 16)
        subtitleLabel.textColor = .red
        stackView.addArrangedSubview(subtitleLabel)
        
        sequenceLabel.font = .systemFont(ofSize: 16)
        sequenceLabel.textColor = .red
        stackView.addArrangedSubview(sequenceLabel)
    }
    
    func addCountLabel() {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Count:"
        subtitleLabel.font = .boldSystemFont(ofSize: 16)
        subtitleLabel.textColor = .blue
        stackView.addArrangedSubview(subtitleLabel)
        
        countLabel.font = .systemFont(ofSize: 16)
        countLabel.textColor = .blue
        stackView.addArrangedSubview(countLabel)
    }
    
    func addPercentegeFC(){
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Percentege:"
        subtitleLabel.font = .boldSystemFont(ofSize: 16)
        subtitleLabel.textColor = .blue
        stackView.addArrangedSubview(subtitleLabel)
        
        percentageFCLabel.font = .systemFont(ofSize: 16)
        percentageFCLabel.textColor = .blue
        stackView.addArrangedSubview(percentageFCLabel)
        
        
        
    }
    
    func createLabelID(){
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Sequence number:"
        subtitleLabel.font = .boldSystemFont(ofSize: 24)
        subtitleLabel.textColor = .black
        stackView.addArrangedSubview(subtitleLabel)
        
        IDlabel.font = .systemFont(ofSize: 24)
       IDlabel.textColor = .black
        stackView.addArrangedSubview(IDlabel)
    }
    
    func updateModel(model : Sequence, row : Int) {
        self.model = model
        
        IDlabel.text = "\(row + 1)"
        sequenceLabel.text = model.text
        countLabel.text = "\(model.count) nucleotides"
        percentageFCLabel.text = model.percentageText
    }
    
   

    func createStackView(){
        
        self.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
  
}
