import Foundation
import SwiftData

@Model
final class Item1To2Link {

    @Attribute(.unique)
    var id: String
    var item: Item
    var item2: Item2
    var someProperty: String

    init(id: String, item: Item, item2: Item2, someProperty: String) {
        self.id = id
        self.item = item
        self.item2 = item2
        self.someProperty = someProperty
    }

}
