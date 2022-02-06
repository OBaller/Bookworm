//
//  ContentView.swift
//  Bookworm
//
//  Created by naseem on 05/02/2022.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    @Environment(\.managedObjectContext) var moc
    @State private var showingAddScreen = false

    
//    @State private var rememberMe = false
//    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationView {
            List(books) { book in
                VStack {
                    HStack {
                        Text(book.title ?? "Unknown")
                        Spacer()
                        Text(book.author ?? "Unknown")
                    }
                    Spacer()
                    HStack {
                        Text(book.genre ?? "")
                        Spacer()
                        Text("\(book.rating)")
                    }
                }
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct PushButton: View {
    let title: String
    @Binding var isOn: Bool

    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]

    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}
