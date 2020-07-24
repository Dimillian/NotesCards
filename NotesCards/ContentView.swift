//
//  ContentView.swift
//  NotesCards
//
//  Created by Thomas Ricouard on 01/07/2020.
//

import SwiftUI
import UI

struct ContentView: View {
    @State private var notes = [Note(name: "Note 1"),
                                Note(name: "Note 2"),
                                Note(name: "Note 3"),
                                Note(name: "Note 4")]
    
    @Namespace private var namespace
    @State private var selectedNote: Note?
    @State private var selectedPage: Int = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: $selectedPage) {
                ForEach(notes) { note in
                    let isSelected = selectedNote?.id == note.id
                    NoteCardView(note: note,
                                 isSelected: isSelected)
                        .tag(notes.firstIndex(where: { $0.id == note.id })!)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.4,
                                                  dampingFraction: 0.65,
                                                  blendDuration: 0)) {
                                if isSelected {
                                    selectedNote = nil
                                } else {
                                    selectedNote = note
                                }
                            }
                        }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode:
                                                selectedNote != nil ? .never : .always))
            .padding(.vertical, 8)
            
            if selectedNote == nil {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation(.spring()) {
                            notes.append(Note(name: "New \(notes.count)"))
                            selectedPage = notes.count - 1
                        }
                    }, label: {
                        Image(systemName: "doc.badge.plus")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.appAccentColor)
                    })
                    Spacer()
                }
                .transition(.scale)
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct NoteCardView: View {
    let note: Note
    let isSelected: Bool
    
    @State private var selectedColor: Color = .background
    
    var scale: CGFloat {
        isSelected ? 0.95 : 0.80
    }
    
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            Text(note.name)
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Spacer()
                Rectangle()
                    .fill(Color.background)
                    .cornerRadius(16)
                    .shadow(color: Color.background.opacity(0.4), radius: 20, x: 0, y: 0)
                    .overlay(NoteContent())
                Spacer()
            }
            Spacer()
            if isSelected {
                CardToolbar()
            }
        }
        .scaleEffect(scale)
    }
}

struct NoteContent: View {
    @State private var text = "Type your content here..."
    
    var body: some View {
        ZStack {
            Text(text)
                .font(.title)
                .foregroundColor(.white)
                .shadow(color: .white, radius: 20)
                .padding(32)
            HStack {
                Spacer()
                TextField("Text", text: $text)
                    .foregroundColor(.clear)
                    .accentColor(.black)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewLayout(.sizeThatFits)
        }
    }
}
