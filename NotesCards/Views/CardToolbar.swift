//
//  CardToolbar.swift
//  NotesCards
//
//  Created by Thomas Ricouard on 04/07/2020.
//

import SwiftUI

struct CardToolbar: View {
    enum Actions: CaseIterable {
        case text, photo, link, drawing
        
        func systemImage() -> String {
            switch self {
            case .text: return "text.cursor"
            case .photo: return "photo.on.rectangle"
            case .link: return "link"
            case .drawing: return "pencil.tip.crop.circle"
            }
        }
    }
    
    var body: some View {
        HStack(spacing: 32) {
            ForEach(Actions.allCases, id: \.self) { action in
                Button(action: {
                    
                },
                label: {
                    Image(systemName: action.systemImage())
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.accentColor)
                })
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16,
                                     style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .fill(Color.gray.opacity(0.3)))
        .transition(.opacity)
    }
}

struct CardToolbar_Previews: PreviewProvider {
    static var previews: some View {
        CardToolbar()
    }
}
