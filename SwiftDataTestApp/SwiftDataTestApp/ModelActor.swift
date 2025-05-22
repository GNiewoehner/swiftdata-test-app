import SwiftData

@ModelActor
actor ModelActor {

    @MainActor
    func createDummyData() {
        let mainContext = modelContainer.mainContext
        let item11 = Item(id: "1", someProperty: "someValue", someProperty2: true, itemLinks: [])
        let item12 = Item(id: "2", someProperty: "someValue2", someProperty2: false, itemLinks: [])
        let item13 = Item(id: "3", someProperty: "someValue3", someProperty2: true, itemLinks: [])
        let item14 = Item(id: "4", someProperty: "someValue4", someProperty2: false, itemLinks: [])

        mainContext.insert(item11)
        mainContext.insert(item12)
        mainContext.insert(item13)
        mainContext.insert(item14)

        let item21 = Item2(id: "1", someProperty: "someValue", someProperty2: true, itemLinks: [])
        let item22 = Item2(id: "2", someProperty: "someValue2", someProperty2: false, itemLinks: [])
        let item23 = Item2(id: "3", someProperty: "someValue3", someProperty2: true, itemLinks: [])
        let item24 = Item2(id: "4", someProperty: "someValue4", someProperty2: false, itemLinks: [])

        mainContext.insert(item21)
        mainContext.insert(item22)
        mainContext.insert(item23)
        mainContext.insert(item24)

        let itemLinks = [Item1To2Link(id: "1", item: item11, item2: item21, someProperty: "someValue"),
                         Item1To2Link(id: "2", item: item11, item2: item22, someProperty: "someValue"),
                         Item1To2Link(id: "3", item: item11, item2: item23, someProperty: "someValue"),
                         Item1To2Link(id: "4", item: item11, item2: item24, someProperty: "someValue"),
                         Item1To2Link(id: "5", item: item12, item2: item21, someProperty: "someValue"),
                         Item1To2Link(id: "6", item: item12, item2: item22, someProperty: "someValue"),
                         Item1To2Link(id: "8", item: item12, item2: item24, someProperty: "someValue"),
                         Item1To2Link(id: "9", item: item13, item2: item23, someProperty: "someValue"),
                         Item1To2Link(id: "10", item: item14, item2: item24, someProperty: "someValue")
        ]

        for itemLink in itemLinks {
            mainContext.insert(itemLink)
        }

        try? modelContainer.mainContext.save()
    }

    @MainActor
    func getItems() -> [Item] {
        let fetchDescriptor = FetchDescriptor<Item>()
        let items = (try? modelContainer.mainContext.fetch(fetchDescriptor)) ?? []
        return items
    }

}
