//
//  AddView.swift
//  TodoList
//
//  Created by Lion on 19/03/2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
     let color =  Color(#colorLiteral(red: 0.9323495381, green: 0.9323495381, blue: 0.9323495381, alpha: 1))
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("Ecrire une tache ici ", text: $textFieldText) // Creation d'un texte transparent
                    .padding(.horizontal) // Forme de la bordure
                    .frame(height: 55) //Taille des bordures
                    .background(color)
                    .cornerRadius(10)
            
                Button(action:  saveButton, label: {
                    
                 // Button Enregistrer
                    Text("Enregistrer".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55) // Espacement
                        .frame(maxWidth: .infinity)
                        .background(Color.cyan)
                        .cornerRadius((10))
                })
            }
            .padding(14) // Ecart entre le titre la bordure
        }
        .navigationTitle("Ajouter un Item ✍️")
        .alert(isPresented: $showAlert, content: getAlert)
     
    }
    func saveButton(){  // Boutton du sauvegarde de la tache crée
        if textIsAppropriate(){
            
            listViewModel.addItem(title: textFieldText) // Ajout de la variable 
            presentationMode.wrappedValue.dismiss()
            
        }
        
    }

    func textIsAppropriate() -> Bool // Si le caractère de la tache est supérieur à 3 caractère
    {
        if textFieldText.count < 3 {
            
            alertTitle = "Ta tache dois contenir  plus de 3 caractère"
            showAlert.toggle() // Affichage Pop-up d'erreur
            return false
        }
            return true
    }
    
    func getAlert() ->  Alert {
        
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
        AddView()
            }
        .environmentObject(ListViewModel())
        .previewInterfaceOrientation(.portrait)
    }
}
