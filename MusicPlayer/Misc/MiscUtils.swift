//
//  MiscUtils.swift
//  MusicPlayer
//
//  Created by Anbalaagn D on 23/08/23.
//

@inlinable func with<T: AnyObject>(
    _ object: T,
    action: (T) throws -> Void
) rethrows -> T {
    try action(object)
    return object
}
