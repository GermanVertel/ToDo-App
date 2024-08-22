//
//  ContentView.swift
//  ToDo App
//
//  Created by German David Vertel Narvaez on 19/08/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    //MARK: LISTA DE TAREAS
    @State var tasks: [Task] = []
    
    //MARK: CREAR NUEVA TAREA
    
    @State private var newTaskTitle: String = ""
    @State private var newTaskPriority: Priority = .normal
    
    @State private var showNewTask = false

    var body: some View {
        ZStack{
            VStack{
                HStack {
                    Text("Lista de tareas")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    
                    Spacer()
                    
                    Button(action: {
                        self.showNewTask = true
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundStyle(.teal)
                    })
                }.padding()
                
                
                
                //Codigo para la lista de tareas
                
                List{
                    ForEach(self.tasks) { task in
                        //TODO: Representar la tarea en una fila
                        
                    }
                }
                .listStyle(.plain) //estilo de la lista
                .rotation3DEffect(
                    Angle(degrees: self.showNewTask ? 8 : 0), axis: (x: 1, y: 0, z: 0))
                .offset(y: self.showNewTask ? -40 : 0)
                .animation(.easeInOut, value: self.showNewTask)
                //CUANDO APAREZCA
                .onAppear{
                    UITableView.appearance().separatorColor = .clear
                }
                
                if self.tasks.count == 0 {
                    //TODO: CREAR VISTA VACIA
                }
                
                if self.showNewTask {
                    //TODO: CREAR EL FORMULARIO PARA UNA NUEVA TAREA
                }
            }
        }
        
    }
    
}
    

#Preview {
    ContentView()
       
}
