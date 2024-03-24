# Swift-UI-iOS17-Swift-Data
You can select `Core Data` in the **Storage** drop-down menu. By doing so, `Xcode` will generate the code needed<br>
to inject the `Core Data stack` into your code. SwiftData is built on top of Core Data.
![swift-data-Apple-ios17](https://github.com/danielurra/Swift-UI-iOS17-Swift-Data/assets/51704179/72b2bf1a-6426-4f77-ba7a-2fe052250553)<br>
## Grab the code - Content View file
```swift
//
//  ContentView.swift
//  Data Practice
//
//  Created by Eusebio Taba on 3/24/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

```
## Grab the code - Item file
```swift
//
//  Item.swift
//  Data Practice
//
//  Created by Eusebio Taba on 3/24/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

```
