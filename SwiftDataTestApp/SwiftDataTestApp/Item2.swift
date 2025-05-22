import Foundation
import SwiftData

@Model
final class Item2 {

    @Attribute(.unique)
    var id: String
    var someProperty: String
    var someProperty2: Bool

    @Relationship(deleteRule: .cascade, inverse: \Item1To2Link.item2)
    var itemLinks: [Item1To2Link]

    init(id: String, someProperty: String, someProperty2: Bool, itemLinks: [Item1To2Link]) {
        self.id = id
        self.someProperty = someProperty
        self.someProperty2 = someProperty2
        self.itemLinks = itemLinks
    }

}
