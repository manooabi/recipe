//
//  RecipePersistanceManager.swift
//  RecipeApp
//
//  Created by Manoo on 1/25/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RecipePersistanceManager{
    
    enum DatabaseError: Error{
        case failedToSaveData
        case failedToFetchData
        case failedToDelete
    }
    
    static let shared = RecipePersistanceManager()
    
    func downloadtTitleWith(model: Food, completion: @escaping (Result<Void,Error>) -> Void){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let item = RecipeItem(context: context)
        
        item.foodName = model.foodName
        item.foodId = Int64(model.foodId)
        item.categories = model.categories
        item.ingredients = model.indegredients
        item.photo = model.photo
        item.descriptions = model.description
        
        do{
            try context.save()
            completion(.success(()))
        }catch{
            completion(.failure(DatabaseError.failedToSaveData))
        }
    }
    func fetchingTitlesFromDataBase(completion: @escaping (Result<[RecipeItem],Error>) -> Void){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
               
               return
           }
           let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<RecipeItem>
        request = RecipeItem.fetchRequest()
        
        do{
            
             let titles = try context.fetch(request)
            completion(.success(titles))
            
        }catch{
            completion(.failure(DatabaseError.failedToFetchData))
        }
    }
    func deleteTitleWith(model: RecipeItem, completion: @escaping (Result<Void,Error>) -> Void){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
                      
                      return
                  }
                  let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        do{
            try context.save()
            completion(.success(()))
        }catch{
            completion(.failure(DatabaseError.failedToDelete))
        }
    }
}
