import Foundation

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let aMedia = MediaItem(name: "Avatar")
let aMovie = Movie(name: "Casablanca", director: "Michael Curtiz")

print(aMedia is MediaItem)  // true
print(aMedia is Movie)      // false
print(aMedia is Song)       // false

print("-----------------------------------------------")

print(aMovie is MediaItem)  // true
print(aMovie is Movie)      // true
print(aMovie is Song)       // false

print("-----------------------------------------------")

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var (movieCount, songCount) = (0, 0)

//library.forEach {
//    if $0 is Movie {
//        movieCount += 1
//    } else if $0 is Song {
//        songCount += 1
//    }
//}

library.forEach {
    switch $0 {
    case is Movie: movieCount += 1
    case is Song: songCount += 1
    default: break
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")
