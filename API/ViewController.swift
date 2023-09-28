import UIKit

class ViewController: UIViewController {

    @IBAction func getLuciferQuote() {
        if let url = URL(string: "https://lucifer-quotes.vercel.app/api/quotes") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let quotes = try? JSONDecoder().decode([Quote].self, from: data) {
                    for quote in quotes {
                        let formattedQuote = "\(quote.author): \"\(quote.quote)\""
                        print("Lucifer Quote: \(formattedQuote)")
                    }
                }
            }.resume()
        }
    }

    @IBAction func getStrangerThingsQuote() {
        if let url = URL(string: "https://strangerthings-quotes.vercel.app/api/quotes") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let quotes = try? JSONDecoder().decode([Quote].self, from: data) {
                    for quote in quotes {
                        let formattedQuote = "\(quote.author): \"\(quote.quote)\""
                        print("Stranger Things Quote: \(formattedQuote)")
                    }
                }
            }.resume()
        }
    }

    @IBAction func getRandomFact() {
        if let url = URL(string: "https://uselessfacts.jsph.pl/api/v2/facts/random") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let fact = try? JSONDecoder().decode(Fact.self, from: data) {
                    let formattedFact = "Fact: \(fact.text)"
                    print("Random Fact: \(formattedFact)")
                }
            }.resume()
        }
    }
}

struct Quote: Codable {
    let quote: String
    let author: String
}

struct Fact: Codable {
    let text: String
}
