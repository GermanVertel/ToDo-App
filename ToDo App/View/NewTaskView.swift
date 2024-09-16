//
//  NewTaskView.swift
//  ToDo App
//
//  Created by German David Vertel Narvaez on 14/09/24.
//

import SwiftUI

struct NewTaskView: View {
    
    @Binding var isShow: Bool
    @Binding var tasks: [Task]
    
    @State var title: String
    @State var priority: Priority
    @State var isEditing = false
    
    
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    Text("Añade una nueva tarea")
                        .font(.system(.title, design: .rounded))
                    Spacer()
                    Button(action: {
                        self.isShow = false
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.teal)
                            .font(.title)
                    })
                    Spacer()
                    
                
                }
                .padding()
            }
            
            TextField("Añade una tarea", text:  self.$title) { editingChanged in
                self.isEditing = editingChanged
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(16)
            .padding(.bottom)
               
            Text("Prioridad")
                .font(.system(.headline))
           
            HStack {
                Text("Alta")
                    .font(.system(.headline, design: .rounded))
                    .padding(18)
                    .background(self.priority == .hight ? Priority.hight.color() : Color(.systemGray4))
                    .cornerRadius(12)
                    .onTapGesture {
                        self.priority = .hight
                    }
                
                Text("Media")
                    .font(.system(.headline, design: .rounded))
                    .padding(18)
                    .background(self.priority == .normal ? Priority.normal.color() : Color(.systemGray4))
                    .cornerRadius(12)
                    .onTapGesture {
                        self.priority = .normal
                    }
                
                Text("Baja")
                    .font(.system(.headline, design: .rounded))
                    .padding(18)
                    .background(self.priority == .low ? Priority.low.color() : Color(.systemGray4))
                    .cornerRadius(12)
                    .onTapGesture {
                        self.priority = .low
                    }
            }.padding(.bottom)
       
           
            
            Button(action: {
                
                if self.title.trimmingCharacters(in: .whitespaces) == "" {
                    return
                }
                
                self.isShow = false
                self.addNewTask(title: self.title, priority: self.priority)
                
            }, label: {
                Text("Guardar Tarea")
                    .font(.system(.headline, design: .rounded))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding( )
                    .background(.teal)
                    .foregroundStyle(.white)
                    .cornerRadius(16)
                    
            })
            .padding(.bottom)
            
        }
        .padding()
        .background(.white)
        .cornerRadius(16, antialiased: true)
        .offset(y: self.isEditing ? -320 : 0)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func addNewTask(title: String, priority: Priority, isCompleted: Bool = false){
        let task = Task(title: title, priority: priority, isCompleted: isCompleted)
        self.tasks.append(task)
    }
}

#Preview {
    NewTaskView(isShow: .constant(true), tasks: .constant([]) , title: "", priority: .normal)
}
