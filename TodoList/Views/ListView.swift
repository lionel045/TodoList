//
//  ListView.swift
//  TodoList
//
//  Created by Lion on 19/03/2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            
            if listViewModel.items.isEmpty {
                
               NoItemsView() // lorsque la liste est vide la methode NoItem est appeler
            }
            else  //Lorsque la liste n'est pas vide voici la methode
            {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture { //Lorsque un clic est enclenché
                            withAnimation(.linear){
                                listViewModel.updateItem(item: item) // La tache s'actualise
                                }
                           }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
            
        }
   
        .navigationTitle("Todo List🧐📝") // Le nom de notre label
        .navigationBarItems(
            leading: EditButton() .foregroundColor(.cyan),
            
            trailing:
                NavigationLink("Ajouter", destination: AddView()) // Bouton
                .foregroundColor(.cyan)
        )
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView{
                
               ListView()
            }
            .preferredColorScheme(.light)
        .environmentObject(ListViewModel())
            NavigationView{
                
                ListView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
        }
    }
}
