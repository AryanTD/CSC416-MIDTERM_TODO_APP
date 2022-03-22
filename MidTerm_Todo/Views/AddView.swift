//
//  AddView.swift
//  MidTerm_Todo
//
//  Created by student on 3/22/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type here...", text: $textFieldText)
                    .padding()
                    .background(Color(hue: 0.704, saturation: 0.283, brightness: 0.951, opacity: 0.664))
                    .cornerRadius(10)
                    
                Button(action: saveButtonPressed, label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hue: 0.711, saturation: 0.859, brightness: 0.951))
                            .font(.headline)
                            .cornerRadius(10)
                            
                })
            }
            .padding()
        }
        .navigationTitle("Add an Item ➕")
        .alert(isPresented: $showAlert, content: getAlert)
        }

    
    func saveButtonPressed(){
        if checkText(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func checkText() -> Bool{
        if textFieldText.count < 1{
            alertTitle = "Cannot be empty"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}


