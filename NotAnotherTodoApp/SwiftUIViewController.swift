//
//  SwiftUIViewController.swift
//  NotAnotherTodoApp
//
//  Created by Tanin on 22/04/2023.
//

import SwiftUI

struct SwiftUIViewController: View {
    
    @State var isAddingItem = false
    @State var todoItems: [String] = [
        "Use Accessibility Inspector",
        "Use Environment Overrider",
        "Demonstarte a11y curtain",
        "Demonstarte speaking rate adjusting",
        "Using Voice Control"
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Text("To do")
                    .font(.largeTitle)
                
                // this works but doesn't have separator
                ForEach(0..<todoItems.count, id: \.self) { index in
                    Text(todoItems[index])
                }
                
                Button(action: {
                    isAddingItem = true
                    todoItems.append("")
                }, label: {
                    Text("⨁ New task")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(22)
                })
            }
            .padding()
        }
    }
}

struct UIKitViewController_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewController()
    }
}
