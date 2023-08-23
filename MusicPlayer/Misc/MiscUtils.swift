//
//  MiscUtils.swift
//  MusicPlayer
//
//  Created by anbalagan-8641 on 23/08/23.
//

@inlinable func with<T: AnyObject>(
    _ object: T,
    action: (T) -> Void
) -> T {
    action(object)
    return object
}
