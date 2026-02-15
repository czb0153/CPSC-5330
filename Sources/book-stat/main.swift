import Foundation

extension String {
    static func *(left: String, right: Int) -> String {
        return String(repeating: left, count: right)
    }
}

let books: [(title: String, pages: Int, rating: Double)] = [
    (title: "The Greatest Show on Earth", pages: 320, rating: 4.5),
    (title: "The Age of Reason", pages: 250, rating: 4.0),
    (title: "The Sun Also Rises", pages: 200, rating: 3.8),
    (title: "Hitch 22", pages: 400, rating: 4.2),
    (title: "The Hitchhiker's Guide to the Galaxy", pages: 180, rating: 4.7),
    (title: "Great Gatsby", pages: 180, rating: 4.3),
    (title: "Rights of Man", pages: 300, rating: 4.1),
    (title: "The Chronicles of Narnia", pages: 350, rating: 4.6),
    (title: "Huckleberry Finn", pages: 220, rating: 4.4),
    (title: "Hope After Faith", pages: 150, rating: 3.9)
]

func analyzePageCounts(from bookList:[(title: String, pages: Int, rating: Double)]) -> 
    (maxPages: Int, minPages: Int, averagePages: Double, maxBook: String, minBook: String) {

    guard !bookList.isEmpty else {
        return (0, 0, 0.0, "", "")
    }

    var maxPages = bookList[0].pages
    var minPages = bookList[0].pages
    var totalPages = 0
    var maxBook = bookList[0].title
    var minBook = bookList[0].title

    for book in bookList {
       totalPages += book.pages

        if book.pages > maxPages {
            maxPages = book.pages
            maxBook = book.title
        }

        if book.pages < minPages {
            minPages = book.pages
            minBook = book.title
        }

    }

    let averagePages = Double(totalPages) / Double(bookList.count)

    return (maxPages, minPages, averagePages, maxBook, minBook)
}

func filterBooks(from bookList: [(title: String, pages: Int, rating: Double)], 
    where condition: ((title: String, pages: Int, rating: Double)) -> Bool) -> [(title: String, pages: Int, rating: Double)] {
        return bookList.filter(condition)
}

print("Book Collection Analysis")
print(String(repeating: "=", count: 50))

print("\nComplete List of Books:")
for (index, book) in books.enumerated() {
    print("\(index + 1). \"\(book.title)\" - \(book.pages) pages, Rating: \(book.rating)")
}

let stats = analyzePageCounts(from: books)

print("\n" + String(repeating: "=", count: 50))
print("Page Count Statistics:")
print(String(repeating: "=", count: 50))
print("Longest Book: \"\(stats.maxBook)\" with \(stats.maxPages) pages")
print("Shortest Book: \"\(stats.minBook)\" with \(stats.minPages) pages")
print("Average Page Count: \(String(format: "%.1f", stats.averagePages)) pages")

print("\n" + String(repeating: "=", count: 50))
print("Filter 1: Books with more than 300 pages")
print(String(repeating: "=", count: 50))

let longBooks = filterBooks(from: books) { book in 
    book.pages > 300
}

if longBooks.isEmpty {
    print("No books found with more than 300 pages.")
} else {
    for book in longBooks {
        print("• \"\(book.title)\" - \(book.pages) pages")
    }
}

print("\n" + "=" * 50)
print("Filter 2: Highly rated books (4.0 or higher)")
print("=" * 50)

let highlyRatedBooks = filterBooks(from: books) { book in
    book.rating >= 4.0
}

for book in highlyRatedBooks {
    print("• \"\(book.title)\" - Rating: \(book.rating), \(book.pages) pages")
}

print("\n" + "=" * 50)
print("Filter 3: Compact books (less than 280 pages) with ratings 4.0 or higher")
print("=" * 50)

let compactHighlyRatedBooks = filterBooks(from: books) { book in
    book.pages < 280 && book.rating >= 4.0
}

for book in compactHighlyRatedBooks {
    print("• \"\(book.title)\" - \(book.pages) pages, Rating: \(book.rating)")
}

print("\n" + "=" * 50)
print("Analysis complete!")
print("=" * 50)