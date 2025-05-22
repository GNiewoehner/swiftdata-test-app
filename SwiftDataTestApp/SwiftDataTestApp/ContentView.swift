import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        Text("This is a test app")
            .onAppear() {

                let modelActor =  ModelActor(modelContainer: modelContext.container)
                // Creates some dummy data and adds relationships item <-> item1to2link <-> item2
                modelActor.createDummyData()

                print("Starting items fetch")
                // Fetching the 4 generated dummy items, fetch does not access relationship property
                // With SQL query log enabled we get 4 faults on the itemLinks property, one for each item.
                // -> CoreData: annotation: to-many relationship fault "itemLinks" fulfilled from database
                // Should be no fault -> relationship property not accessed
                let items = modelActor.getItems()
                print("Items fetched")
            }
    }
}

