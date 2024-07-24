//
//  ApiScreen.swift
//  Week2-IOS-Training
//
//  Created by FDC-KYLE-NC-WEB on 7/24/24.
//

import SwiftUI

struct RandomJoke: Decodable {
    let type: String
    let setup: String
    let punchline: String
    let id: Int
}

class RandomJokeViewModel: ObservableObject {
    @Published var randomJoke: RandomJoke?
    
    init() {
        fetchRandomJoke()
    }
    
    func fetchRandomJoke() {
        // URL for the random joke API endpoint
        let urlString = "https://official-joke-api.appspot.com/random_joke"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let joke = try? decoder.decode(RandomJoke.self, from: data) {
                    DispatchQueue.main.async {
                        self?.randomJoke = joke
                    }
                }
            }
        }.resume()
    }
}

struct ApiScreen: View {
    @StateObject private var viewModel = RandomJokeViewModel()
    @State var isPresentingSecondView = false
    
    var body: some View {
        VStack {
            if let joke = viewModel.randomJoke {
                Text(joke.setup)
                    .font(.headline)
                    .padding()
                Text(joke.punchline)
                    .font(.subheadline)
                    .padding()
                Text(joke.type)
                    .font(.subheadline)
                    .padding()
            } else {
                Text("Loading joke...")
                    .font(.headline)
                    .padding()
            }
            
            Button("Next Joke"){
                viewModel.fetchRandomJoke()
            }
            
            Button("Next Screen"){
                isPresentingSecondView.toggle()
            }
        }
        .onAppear {
            viewModel.fetchRandomJoke()
        }
    }
}

struct SecondView: View{
    @Binding var viewModel : RandomJokeViewModel
    @State private var author = ""
    var body: some View{
        if let joke = viewModel.randomJoke {
            Text(joke.setup)
                .font(.headline)
                .padding()
            Text(joke.punchline)
                .font(.subheadline)
                .padding()
            Text(joke.type)
                .font(.subheadline)
                .padding()
            TextField("Author", text: $author)
        } else {
            Text("Loading joke...")
                .font(.headline)
                .padding()
        }
        
        Button("Next Joke"){
            viewModel.fetchRandomJoke()
        }
    }
}

#Preview {
    ApiScreen()
}
