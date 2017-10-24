import UIKit
import CoreData


class ProfileViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var surname: UITextField!
    
    @IBOutlet weak var mobilePhone: UITextField!
    
    @IBOutlet weak var carModel: UITextField!
    
    @IBOutlet weak var fuelType: UITextField!
    
    @IBOutlet weak var expDrive: UITextField!
    
    let managedObject = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // work with CoreData
    
    
    @IBAction func saveData(_ sender: Any) {
        
        let entityDescrioption = NSEntityDescription.entity(forEntityName: "UserInformation", in: managedObject)
        
        let userInfo = UserInformation(entity: entityDescrioption!, insertInto: managedObject)
        
        userInfo.name = name.text
        userInfo.carExp = expDrive.text
        userInfo.fuelForCar = fuelType.text
        userInfo.mobilePhone = mobilePhone.text
        userInfo.surname = surname.text
        userInfo.modelOfCar = carModel.text
        
        do {
            
            try managedObject.save()
            name.text = ""
            expDrive.text = ""
            fuelType.text = ""
            mobilePhone.text = ""
            surname.text = ""
            carModel.text = ""
            
        }
        catch let error{
            print("Error with Core Data\(error)")
        }
        
        
    }
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {// touch on empty place
        
        super.touchesBegan(touches, with:event)
        self.view.endEditing(true)
    
   
    }
    


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {// touch on button
        
        textField.resignFirstResponder()
        return (true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.delegate = self
       self.surname.delegate = self
        self.mobilePhone.delegate = self
        self.carModel.delegate = self
        self.expDrive.delegate = self
        self.fuelType.delegate = self
      

        // Do any additional setup after loading the view.
    }

  

}
