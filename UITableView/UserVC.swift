
import UIKit

class UserVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtFusername: UITextField!
    
    var arrUsers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        cell.textLabel?.text = arrUsers[indexPath.row]
        
        return cell
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        if let text = txtFusername.text{
            arrUsers.append(text)
            let indexPath = IndexPath(row: arrUsers.count - 1, section: 0)
            tableView.beginUpdates()
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            txtFusername.text = ""
        }
    }
    
    @IBAction func btnEdit(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        arrUsers.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAct = UIContextualAction(style: .destructive, title: "Delete") { action, view, compeletion in
            self.arrUsers.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            compeletion(true)
            
            print("Was Deleted \(self.arrUsers[indexPath.row])")
        }
        
        let favoriteAct = UIContextualAction(style: .normal, title: "Favorite") { (_, _, _) in
            print("Added to Favorite \(self.arrUsers[indexPath.row])")
        }
        
        deleteAct.image = UIImage(systemName: "trash")
        favoriteAct.image = UIImage(systemName: "heart")
        
        
        return UISwipeActionsConfiguration(actions: [deleteAct, favoriteAct])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
