//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-14.
//

import Foundation
import Plot
import Publish

protocol DatedComponent: Component {
    var date: Date { get }
    var previewBox: Component { get }
}

extension DatedComponent where Self: Comparable {
    func asComparable() -> AnyComparableDatedComponent {
        AnyComparableDatedComponent(self)
    }
}

struct AnyComparableDatedComponent: DatedComponent, Comparable {

    var date: Date { _value.date }
    var body: Component { _value.body }
    var previewBox: Component { _value.previewBox }
    private let _value: DatedComponent
    
    init(_ value: DatedComponent) {
        self._value = value
    }
    
    static func == (lhs: AnyComparableDatedComponent, rhs: AnyComparableDatedComponent) -> Bool {
        lhs.date == rhs.date
    }
    
    static func < (lhs: AnyComparableDatedComponent, rhs: AnyComparableDatedComponent) -> Bool {
        lhs.date < rhs.date
    }
}

