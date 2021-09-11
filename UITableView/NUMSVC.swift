
import UIKit

class NUMSVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var numTableView: UITableView!
    
    var arrNumbers = [String]()
    let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numTableView.delegate = self
        numTableView.dataSource = self
        refreshControl.tintColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        refreshControl.addTarget(self, action: #selector(getData), for: .valueChanged)
        numTableView.addSubview(refreshControl)

    }
    @objc
    func getData() {
        arrNumbers.append("value \(arrNumbers.count)")
        refreshControl.endRefreshing()
        numTableView.reloadData()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = numTableView.dequeueReusableCell(withIdentifier: "NUMS", for: indexPath)
        cell.textLabel?.text = arrNumbers[indexPath.row]
        
        
        return cell
        
    }

}
