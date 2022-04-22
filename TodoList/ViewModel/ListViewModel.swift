//
//  ListViewModel.swift
//  TodoList
//
//  Created by Lion on 20/03/2022.
//

import Foundation

/*
{
    Create
    Read
    Update
    Delete
    
    
    
}
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        
    
    didSet {  //Apres la modification de la variable
        
        saveItems()
    }
    }
    
    let itemsKey: String = "items_list"
    init() {
        
        getItems()
        
    }
    
    func getItems() {
        
        guard
                let  data = UserDefaults.standard.data(forKey: itemsKey),
                let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data) ///Appel d'un optionnel Pour tester que les methode foncitonne
        else { return }
        
        self.items = saveItems
        }
        
     /*   let newItems = [
            ItemModel(title: "Faire mes courses", isCompleted: false),
            ItemModel(title: " Sortir prendre l'air", isCompleted: true),
            ItemModel(title: " Je vais faire un peu de sport ", isCompleted: false)
            
        ]

        items.append(contentsOf: newItems)
  
      */
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        
    }



func moveItem(from: IndexSet, to: Int)
{
    
    items.move(fromOffsets: from, toOffset: to)
    }


    func addItem(title: String)
    {
        let newItem = ItemModel(title: title , isCompleted: false ) // Ajout d'un element dans le tableau item
        items.append(newItem)
    }
     
 func updateItem (item: ItemModel)
    { // Mise à jour des taches en cours
        
 
        if let index = items.firstIndex(where: {$0.id == item.id})
        {
            items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)   // Validation de la tache ou annulation de celle-ci
        }
 }
 
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items)
        { // Convertis un tableau en fichier data JSON
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
            
        }
    }
}
