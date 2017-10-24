import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var titleFuel: UILabel!
    
    @IBOutlet weak var coast: UILabel!
  
    @IBOutlet weak var liters: UILabel!

    @IBOutlet weak var sliderValue: UISlider!
    @IBAction func sliderLiters(_ sender: UISlider) {
        
      coast.text = "\(sliderValue.value * 1.34) BYN"
        liters.text = "\(sliderValue.value)"
        
    }
 
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
