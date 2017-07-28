//
//  Either.swift
//  Collections
//
//  Created by James Bean on 7/11/17.
//
//

/// Either left type or another
public enum Either <Left,Right> {
    case left(Left)
    case right(Right)

    public var left: Left? {
        guard case let .left(value) = self else { return nil }
        return value
    }

    public var right: Right? {
        guard case let .right(value) = self else { return nil }
        return value
    }
}

// TODO: Add retroactive Equatable conformance when/if Swift allows it
public func == <Left: Equatable, Right: Equatable> (
    lhs: Either<Left,Right>,
    rhs: Either<Left,Right>
) -> Bool
{
    switch (lhs,rhs) {
    case let (.left(a), .left(b)):
        return a == b
    case let (.right(a), .right(b)):
        return a == b
    default:
        return false
    }
}

public func != <Left: Equatable, Right: Equatable> (
    lhs: Either<Left,Right>,
    rhs: Either<Left,Right>
) -> Bool
{
    return !(lhs == rhs)
}

public func == <Left: Equatable, Right: Equatable> (
    lhs: [Either<Left,Right>],
    rhs: [Either<Left,Right>]
) -> Bool
{
    guard lhs.count == rhs.count else { return false }
    for (a,b) in zip(lhs,rhs) where a != b { return false }
    return true
}
