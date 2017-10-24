import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var coastDiesel: UILabel!
    
    
    @IBOutlet weak var liters: UILabel!
    
    @IBOutlet weak var sliderInfo: UISlider!
    
    @IBAction func sliderWork(_ sender: UISlider) {
        coastDiesel.text = "\(sliderInfo.value * 1.29) BYN"
        liters.text = "\(sliderInfo.value)"
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
