//
//  CoreDataManager.swift
//  Navigation
//
//  Created by ln on 10.06.2023.
//

import CoreData
import UIKit

public final class CoreDataMamanager: NSObject {
    
    public static let shared = CoreDataMamanager()
    private override init() {}
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    public func createPost(autor: String, image: String, description: String, likes: Int64, views: Int64) {
        guard let postEntityDescription = NSEntityDescription.entity(forEntityName: "CDPost", in: context) else {
            return
        }
        let post = CDPost(entity: postEntityDescription, insertInto: context)
        post.text = description
        post.autor = autor
        post.image = image
        post.likes = likes
        post.views = views
    
        appDelegate.saveContext()
    }
    
    public func fetchPosts() -> [CDPost] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDPost")
        do {
            return (try? context.fetch(fetchRequest) as? [CDPost]) ?? []
        }
    }
    
    public func fetchPost(with description: String) -> CDPost? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDPost")
        fetchRequest.predicate = NSPredicate(format: "text == %@", description)
        do {
            let posts = try? context.fetch(fetchRequest) as? [CDPost]
            return posts?.first
        }
    }
    
    public func deletaAllPhoto() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDPost")
        do {
            let posts = try? context.fetch(fetchRequest) as? [CDPost]
            posts?.forEach { context.delete($0) }
        }

        appDelegate.saveContext()
    }
    
    public func deletaPost(with description: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDPost")
        fetchRequest.predicate = NSPredicate(format: "text == %@", description)
        do {
            guard let posts = try? context.fetch(fetchRequest) as? [CDPost],
                  let post = posts.first else { return}
            context.delete(post)
        }

        appDelegate.saveContext()
    }
    
}

