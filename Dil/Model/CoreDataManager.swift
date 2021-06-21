import UIKit
import CoreData

final class CoreDataManager {
    
    // MARK: - Properties
    
    private let coreDataStack: CoreDataStack
    private let managedObjectContext: NSManagedObjectContext
    
    
    var players: [Players] {
        let request: NSFetchRequest<Players> = Players.fetchRequest()
        //request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        guard let players = try? managedObjectContext.fetch(request) else { return [] }
        return players
    }
    
    
    // MARK: - Initializer
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
        self.managedObjectContext = coreDataStack.mainContext
    }
    
    // MARK: - Manage func Entity
    
//    // Ajout dans CoreData
//
//func createFavorite(label: String, image: UIImage) {
//    let entity = Entity(context: managedObjectContext)
//    entity.label = label
//
//    // Ajouter d'une image dans CoreData en l'a transformant en Data
//    let image = image.pngData()
//    favorite.image = image
//
//    coreDataStack.saveContext()
//}

    
    //Delete
//
//        func deleteName(indexPath : IndexPath) {
//        let removeCellEntityIndexPath = entity[indexPath.row]
//        managedObjectContext.delete(removeCellHomeTasksIndexPath)
//        coreDataStack.saveContext()
//    }
//
//    func deleteAllName() {
//        person.forEach { managedObjectContext.delete($0) }
//        coreDataStack.saveContext()
//    }
//
}