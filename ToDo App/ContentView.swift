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
                        TaskCell(task: task)
                        
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
                    NoTaskView()
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

struct NoTaskView: View {
    var body: some View {
        VStack {
            Image("welcome")
                .resizable()
                .scaledToFit()
            
            Text("No hay tareas para mostrar aun, puedes crear una utilizando el boton + de la parte superior")
                .font(.system(.headline, design: .rounded))
                .padding()
            Spacer()
        }
    }
}

#Preview("No task") {
    NoTaskView()
       
}



//MARK: DISEÑO DE NUESTRA TAREA
struct TaskCell: View {
    @Bindable var task: Task
    var body: some View {
        Toggle(isOn: self.$task.isCompleted) {
            HStack {
                Text(self.task.title)
                    .strikethrough(self.task.isCompleted, color: .teal)
                    .bold()
                .animation(.default)
                Spacer()
                Circle()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(self.task.priority.color())
            }
            
        }
        .toggleStyle(checkboxstyle())
        
        
    }
}

struct checkboxstyle: ToggleStyle{
    func makeBody(configuration: Configuration) -> some View {
        return HStack{
            Image(systemName: configuration.isOn ? "checkmark.circle" : "circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(configuration.isOn ? .teal : .gray)
                .font(.system(size: 24, weight: .bold,design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}


#Preview("celda"){
    TaskCell(task: Task(title: "Prueba de la previe", priority: .hight))
}
