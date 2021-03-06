import CoreData

@objc(Note)
class Note: NSManagedObject
{
	@NSManaged var id: NSNumber!
	@NSManaged var title: String!
	@NSManaged var desc: String!
	@NSManaged var deletedDate: Date?
    
    @NSManaged var wavelength: String!
    
    @NSManaged var moodCity: String!
    @NSManaged var moodWeather: String!
}
