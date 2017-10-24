
import UIKit




class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var dataExample = News()
    
    var dataCellExpanded:Bool = false
    
    var expandedRows = Set<Int>()
    
    let simpleIdentifier = "Identifier"
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleIdentifier) as! CustomMainViewCellScreen //this for access title,label,image
       
       
               cell.title.text = dataExample.titleNews[indexPath.row]
        cell.descr.text = dataExample.newsText[indexPath.row]
        cell.iconCell.image = UIImage(named: dataExample.imageNews[indexPath.row])

        cell.selectionStyle = .blue
        
    cell.isExpanded = self.dataExample.newsText.contains(dataExample.newsText[indexPath.row])
        


                return cell
    }

    
  
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataExample.titleNews.count
    }
   
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomMainViewCellScreen else {
            return
        }
        
        self.expandedRows.remove(indexPath.row)
        cell.isExpanded = false
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
   
    

 

        //Animation For each Cells
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250,20,0)
        cell.layer.transform = transform
        
        UIView.animate(withDuration: 1.0){
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let clear = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Clear"){
        (action,indexPath) -> Void in
            
            self.dataExample.imageNews.remove(at: indexPath.row)
            self.dataExample.newsText.remove(at: indexPath.row)
            self.dataExample.titleNews.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .fade)
        }
       

       

        
        clear.backgroundColor = UIColor(red:2.0 / 255.0,green:136.0 / 255.0,blue:209.0 / 255.0,alpha:0.75)
      

 
        return [clear]
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     // self.tableView.rowHeight = UITableViewAutomaticDimension
           }
}


