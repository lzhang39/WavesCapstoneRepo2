import UIKit
import CoreData

// MUST TURN ON SIMULATE LOCATION WHENEVER TESTING under debug->
import CoreLocation
 

struct Response: Codable {
    let weather: [Mood]
//    let main: Temperature
    let name: String
}
struct Mood: Codable {
    let description: String
}
    
    
//struct Temperature: Codable {
//    let feels_like: Double
//}

// HOW DO WE DO SECRETS MGMT IN SWIFT/IOS ???
//    enum Secrets {
//        static let apiKey = "d21eeb7de3c2e905b2ad8af39cb4b53d"
//    }



class NoteDetailVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, CLLocationManagerDelegate {
    
    // Make global variable
    var waves:String = "select a wave"
    
    var lat:Double?
    var lon:Double?
    
    
    // LOCATION PERMISSIONS for API CALL
     let locationManager = CLLocationManager()
     var currentLocation: CLLocation?

     func setupLocation() {
         locationManager.delegate = self
         locationManager.requestWhenInUseAuthorization()
         locationManager.startUpdatingLocation()
     }
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         if !locations.isEmpty, currentLocation == nil {
             currentLocation = locations.first
             locationManager.stopUpdatingLocation()
             requestWeatherForLocation()
         }
     }
     func requestWeatherForLocation() {
         guard let currentLocation = currentLocation else {
             return
         }
         lon = currentLocation.coordinate.longitude
         lat = currentLocation.coordinate.latitude

        // USE LAT! unconditional unwrapping - lat is optional
        //
        print("\(lon!) | \(lat!)")
     }
    
    // either works !
//     override func viewDidAppear(_ animated: Bool) {
//         super.viewDidAppear(animated)
//         setupLocation()
//     }
     


    
    //Title text Field
    @IBOutlet weak var titleTF: UITextField!
    //Description text Field
    @IBOutlet weak var descTV: UITextView!
    
    var selectedNote: Note? = nil //class?
    
    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData = [["select a wave" ,"0 ft", "10 ft", "25 ft", "40 ft", "50 ft"]]
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
//        setupLocation()
        
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=d21eeb7de3c2e905b2ad8af39cb4b53d"
        getData(from: url)
        
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        
        if(selectedNote != nil)
        {//displays title and description
            titleTF.text = selectedNote?.title
            descTV.text = selectedNote?.desc
        }
    }
    
//     PRINTS LAT/LON IN THE CONSOLE (viewDidAppear calls every time we enter this screen)
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocation()
        
//        let url = "api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=d21eeb7de3c2e905b2ad8af39cb4b53d"
        
    }
    
    
    private func getData(from url: String) {
        // MAKE API REQUEST !!!
        let task = URLSession.shared.dataTask(with: URL(string:url)!, completionHandler: { data, response, error in
            
            //API Validation
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            // have data = JSON decoding !
            //Convert data using JSON decoder to models/some object to use
        var result: Response?
        do {
            result = try JSONDecoder().decode(Response.self, from: data)
        }
        catch {
            print("failed to convert \(error.localizedDescription)")
        }
        guard let json = result else {
            return
        }
            
        print(json.name)
        print(json.weather[0].description)
        })

        task.resume()
    }
    
    
    
    
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Make var global using self
        self.waves = pickerData[component][row]
        print(waves)
        // This method is triggered whenever the user makes a change to the picker selection
        // The parameter named row and component represents what was selected...
    }
    
    
    @IBAction func saveAction(_ sender: Any)
    { if (waves == "select a wave"){
        let alert = UIAlertController(title: "Did you enter Wave Info?", message: "Please make sure you selected your Wavelength", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }else{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        //if selected note is empty; create a new note; newNote doesnt need segue?
        //            if(selectedNote == nil)
        //calling Note class in data model
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
        
        //creating new note
        let newNote = Note(entity: entity!, insertInto: context)
        newNote.id = noteList.count as NSNumber
        newNote.title = titleTF.text
        newNote.desc = descTV.text
        // self.waves also works here ???
        newNote.wavelength = waves
        //
        newNote.deletedDate = Date()
        //                if (newNote.title != nil && newNote.desc != nil) {
        
        do
                {//saving to noteList array
                    //                    try context.save()
                    //                    noteList.append(newNote)
                    //                    // ***
                    //                    navigationController?.popViewController(animated: true)
                    if waves == "0 ft"{
                        
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ZeroFTVC") as? ZeroFTVC
                        self.navigationController?.pushViewController(vc!, animated: true)
                    } else if waves == "10 ft"{
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OneFTVC") as? OneFTVC
                        self.navigationController?.pushViewController(vc!, animated: true)
                    }else if waves == "25 ft"{
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TwoFTVC") as? TwoFTVC
                        self.navigationController?.pushViewController(vc!, animated: true)
                    }else if waves == "40 ft"{
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FourFTVC") as? FourFTVC
                        self.navigationController?.pushViewController(vc!, animated: true)
                    }else if waves == "50 ft"{
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ThreeFTVC") as? ThreeFTVC
                        self.navigationController?.pushViewController(vc!, animated: true)
                    }
                    try context.save()
                    noteList.append(newNote)
                }
        catch
        {
            print("context save error")
        }
        
    }
    
    
    //if selected note is not empty
    //            else //edit
    //            { //fetch note
    //                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
    //                do {
    //                    let results:NSArray = try context.fetch(request) as NSArray
    //                    for result in results
    //                    {
    //                        let note = result as! Note
    //                        if(note == selectedNote)
    //                        {//display note info?
    //                            note.title = titleTF.text
    //                            note.desc = descTV.text
    //                            try context.save()
    //                            navigationController?.popViewController(animated: true)
    //                        }
    //                    }
    //                }
    //                catch
    //                {
    //                    print("Fetch Failed")
    //                }
    //            }
    
    
    //Deleting Note
//    @IBAction func DeleteNote(_ sender: Any)
//    {//core data persistent container
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//        //fetching info from Note entity
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
//        do {
//            let results:NSArray = try context.fetch(request) as NSArray
//            for result in results
//            {//if note is slected, delete
//                let note = result as! Note
//                if(note == selectedNote)
//                {
//                    note.deletedDate = Date()
//                    try context.save()
//                    navigationController?.popViewController(animated: true) //pop up display
//                }
//            }
//        }
//        catch
//        {
//            print("Fetch Failed")
//        }
//    }
//
    
    }
}

