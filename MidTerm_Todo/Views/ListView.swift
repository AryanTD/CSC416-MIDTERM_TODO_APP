//
//  ListView.swift
//  MidTerm_Todo
//
//  Created by student on 3/22/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        VStack(){
            if(listViewModel.items.isEmpty){
                    
                    NavigationLink(destination: AddView()){
                        Text("Add Items")
                        }
                    .padding(30)
                    .font(.title)
                    
                
                
                }
           
        
            List{
                ForEach(listViewModel.items){ item in
                    ListRowView(item: item)
                        .onTapGesture{
                            withAnimation(.linear){
                                listViewModel.updateItem(item: item)
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
                
            }
            
            .navigationTitle("Todo List")
            .frame(alignment: .center)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("Add", destination: AddView())
            )
                
        
            
            
            
                
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 0.72, saturation: 0.919, brightness: 0.642)/*@END_MENU_TOKEN@*/)
    
    
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        ListView()
        }
        .environmentObject(ListViewModel())
    }
}

