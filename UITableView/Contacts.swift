
import UIKit

class Contacts: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    

    @IBOutlet weak var showContacts: UITableView!
    
   var arrSection = ["A","S","M","Z"]
   var arrRows = [["Abdulkarim", "Ali", "Abdulaziz"],["Saleh", "Saud"],["Mohammed", "Masad"],["Ziyad", "Zahra"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showContacts.delegate = self
        showContacts.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRows[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = showContacts.dequeueReusableCell(withIdentifier: "Conts", for: indexPath)
        showContacts.beginUpdates()
        showContacts.endUpdates()
        cell.textLabel?.text = arrRows[indexPath.section][indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSection.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrSection[section]
    }
    
}
