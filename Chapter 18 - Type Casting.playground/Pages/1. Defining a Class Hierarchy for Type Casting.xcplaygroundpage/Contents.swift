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

// ---------------------------------------------------------------

let movies = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Movie(name: "Citizen Kane", director: "Orson Welles")
]

print(type(of: movies))     // Array<Movie>

// Iterating Over [Movies]

movies.forEach { print("The director of \($0.name) is \($0.director).") }

// ---------------------------------------------------------------

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

print(type(of: library))    // Array<MediaItem>

// Iterating Over [MediaItem] having <Movie>, <Song>


