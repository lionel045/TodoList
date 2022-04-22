//
//  NoItemsView.swift
//  TodoList
//
//  Created by Lion on 26/03/2022.
//

import SwiftUI

struct NoItemsView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("Il n'y a aucun élement ! ")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Est-tu une personne productive si oui ? Il ne te reste plus qu'à ajouter une tache")
            
            NavigationLink(
                destination: AddView(),
                label: {
                    
                    Text("C'est Parti 🤩")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.cyan)
                        .cornerRadius(10)
                })
            
            }
            .multilineTextAlignment(.center)
            .padding(40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        NoItemsView()
            .navigationTitle("Vide")
        }
    }
}
