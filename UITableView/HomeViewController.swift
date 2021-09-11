
import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var arrFruit = [Fruits]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        arrFruit.append(Fruits.init(name: "Orange", price: "8", decription: "Orange Color", photo: UIImage(named: "orange")!))
        arrFruit.append(Fruits.init(name: "Apple", price: "7", decription: "Red Color", photo: UIImage(named: "apple")!))
        arrFruit.append(Fruits.init(name: "Banana", price: "5", decription: "Yellow Color", photo: UIImage(named: "bana")!))
        arrFruit.append(Fruits.init(name: "Mango", price: "10", decription: "Orange Color", photo: UIImage(named: "mango")!))
        arrFruit.append(Fruits.init(name: "Lemon", price: "3", decription: "Yellow Color", photo: UIImage(named: "lemon")!))
        arrFruit.append(Fruits.init(name: "Papaya", price: "9", decription: "Orange Color", photo: UIImage(named: "papaya")!))
       


    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFruit.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
        let data = arrFruit[indexPath.row]
        cell.setupCell(photo: data.photo, name: data.name, price: data.price, description: data.decription)
        cell.btnFovFruit.tag = indexPath.row
        cell.btnFovFruit.addTarget(self, action: #selector(addToFavorite(sender:)), for: .touchUpInside)
       // cell.btnFovFruit.addTarget(self, action: #selector(removeToFavorite(remove:)), for: .touchDragExit)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell index = \(arrFruit[indexPath.row].name)")
    }
    
    
    @objc
    func addToFavorite(sender: UIButton) {
        print("button index = \(sender.tag)")
        sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
//    @objc
//    func removeToFavorite(remove: UIButton) {
//        print("button index = \(remove.tag)")
//        remove.setImage(UIImage(systemName: "heart"), for: .normal)
//    }
    
    
    
}

struct Fruits {
    let name : String
    let price : String
    let decription : String
    let photo : UIImage
}
