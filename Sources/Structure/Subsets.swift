//
//  Subsets.swift
//  Collections
//
//  Created by James Bean on 12/23/16.
//
//

extension Collection {

    // MARK: - Subsets

    /// - returns: All combinations of with a given cardinality
    /// (how many elements chosen per combination).
    public func subsets(cardinality k: Int) -> [[Element]] {

        func subsets(cardinality k: Int, appendingTo prefix: [Element], at index: Index)
            -> [[Element]]
        {
            guard k > 0 else { return [prefix] }
            if index < endIndex {
                let next = indices.index(after: index)
                return (
                    subsets(cardinality: k - 1, appendingTo: prefix + [self[index]], at: next) +
                    subsets(cardinality: k, appendingTo: prefix, at: next)
                )
            }
            return []
        }

        return subsets(cardinality: k, appendingTo: [], at: startIndex)
    }
}
