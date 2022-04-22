//
//  ListRowView.swift
//  TodoList
//
//  Created by Lion on 19/03/2022.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle" ) // Verifie si le boutton check est validé
                .foregroundColor(item.isCompleted ? .green : .red) //utilasation d'un ternary operator pour verifier si la case est cocher ou non
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 =  ItemModel(title: "First item", isCompleted: false)
    static var item2 =  ItemModel(title: "Second  item", isCompleted: true)
    
    
    
    static var previews: some View {
        
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}

