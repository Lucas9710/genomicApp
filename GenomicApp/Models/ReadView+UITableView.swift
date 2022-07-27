import Foundation
import UIKit

extension ReadView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.sequences.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReadViewTableViewCell
        let index = indexPath.row
        let sequence = sequences[index]
        cell.updateModel(model: sequence, row: index)
        return cell
    }
}

extension ReadView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let sequence = sequences[index]
        self.sequenceUpdate(sequence)
    }
}
