import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var coast: UILabel!
    
    @IBOutlet weak var liters: UILabel!
 
    
    @IBOutlet weak var sliderInfo: UISlider!
    
    
    
    @IBAction func sliderWork(_ sender: UISlider) {
        coast.text = "\(sliderInfo.value * 0.66) BYN"
        liters.text = "\(sliderInfo.value)"
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

 

}
