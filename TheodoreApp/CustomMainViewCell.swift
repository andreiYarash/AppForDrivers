import UIKit


class CustomMainViewCellScreen: UITableViewCell {

    
    @IBOutlet weak var iconCell: UIImageView!
  
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var descr: UILabel!
    
    
    @IBOutlet weak var heightLabel: NSLayoutConstraint!
    
   
    var isExpanded:Bool = false{
        didSet{
            if !isExpanded{
                self.heightLabel.constant = 80.0
                
            }
            else {
                
              self.heightLabel.constant = 0.0
                
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

}


