//
//  SortedArray.swift
//  Collections
//
//  Created by James Bean on 12/10/16.
//
//

import Algebra

/// `Array` that keeps itself sorted.
public struct SortedArray <Element: Comparable>:
    RandomAccessCollectionWrapping,
    SortedCollectionWrapping
{

    // MARK: - Instance Properties

    /// Underlying storage of elements contained herein.
    public var base: [Element] = []

    // MARK: - Initializers

    /// Create an empty `SortedArray`.
    public init() { }

    /// Create a `SortedArray` with the given sequence of `elements`.
    public init <S> (_ elements: S) where S: Sequence, S.Element == Element {
        self.init(presorted: Array(elements).sorted())
    }

    /// Create a `SortedArray` with the given array of presorted elements.
    ///
    /// - Warning: You must be certain that `presorted` is sorted, otherwise undefined lays ahead.
    public init <S> (presorted: S) where S: Sequence, S.Element == Element {
        self.base = Array(presorted)
    }

    // MARK: - Instance Methods

    /// Remove the given `element`, if it is contained herein.
    ///
    /// - TODO: Make `throws` instead of returning silently.
    public mutating func remove(_ element: Element) {
        guard let index = base.index(of: element) else { return }
        base.remove(at: index)
    }

    /// Insert the given `element`.
    ///
    /// - Complexity: O(_n_)
    public mutating func insert(_ element: Element) {
        let index = self.index(for: element)
        base.insert(element, at: index)
    }

    /// Insert the contents of another sequence of `T`.
    public mutating func insert <S> (contentsOf elements: S)
        where S: Sequence, S.Element == Element
    {
        elements.forEach { insert($0) }
    }

    /// - Returns: Index for the given `element`, if it exists. Otherwise, `nil`.
    public func index(of element: Element) -> Int? {
        let index = self.index(for: element)
        guard index < count, base[index] == element else { return nil }
        return index
    }

    /// Binary search to find insertion point
    ///
    // FIXME: Move to extension on `BidirectionCollection where Element: Comparable`.
    // FIXME: Add to `SortedCollection`
    private func index(for element: Element) -> Int {
        var start = 0
        var end = base.count
        while start < end {
            let middle = start + (end - start) / 2
            if element > base[middle] {
                start = middle + 1
            } else {
                end = middle
            }
        }
        return start
    }
}

extension SortedArray: Equatable { }

extension SortedArray {

    /// - Returns: The slice of the `SortedArray` for the given `bounds`.
    public subscript(bounds: Range<Base.Index>) -> Slice<Base> {
        return Slice(base: base, bounds: bounds)
    }
}

extension SortedArray: Additive {

    // MARK: - Additive

    /// - Returns: Empty `SortedArray`.
    public static var zero: SortedArray<Element> {
        return SortedArray()
    }

    /// - returns: `SortedArray` with the contents of two `SortedArray` values.
    public static func + <T> (lhs: SortedArray<T>, rhs: SortedArray<T>) -> SortedArray<T> {
        var result = lhs
        result.insert(contentsOf: rhs)
        return result
    }
}

extension SortedArray: Monoid {

    // MARK: - Monoid

    /// - Returns: Empty `SortedArray`.
    public static var identity: SortedArray<Element> {
        return .zero
    }

    /// - Returns: Composition of two of the same `Semigroup` type values.
    public static func <> (lhs: SortedArray<Element>, rhs: SortedArray<Element>)
        -> SortedArray<Element>
    {
        return lhs + rhs
    }
}

extension SortedArray: ExpressibleByArrayLiteral {

    // MARK: - ExpressibleByArrayLiteral

    /// - returns: Create a `SortedArray` with an array literal.
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
}
