//
//  CollegeUniversities.swift
//  Week2-IOS-Training
//
//  Created by FDC-KYLE-NC-WEB on 7/24/24.
//

import SwiftUI

struct University: Decodable, Identifiable {
    let id = UUID()
    let alphaTwoCode: String
    let webPages: [String]
    let country: String
    let domains: [String]
    let name: String
    let stateProvince: String?
    
    enum CodingKeys: String, CodingKey {
        case alphaTwoCode = "alpha_two_code"
        case webPages = "web_pages"
        case country
        case domains
        case name
        case stateProvince = "state-province"
    }
}
class ViewModel: ObservableObject {
    @Published var universities: [University] = []
    
    func fetch() {
        guard let url = URL(string: "http://universities.hipolabs.com/search?country=United+Kingdom") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("Invalid response")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Print the raw data received
            if let dataString = String(data: data, encoding: .utf8) {
                print("Raw data received:")
                print(dataString)
            }
            
            do {
                let universities = try JSONDecoder().decode([University].self, from: data)
                DispatchQueue.main.async {
                    self?.universities = universities
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}

struct CollegeUniversities: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if !viewModel.universities.isEmpty {
                    List(viewModel.universities) { university in
                        UniversityRowView(university: university)
                    }
                    .listStyle(PlainListStyle())
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2)
                        .onAppear {
                            viewModel.fetch()
                        }
                }
            }
            .navigationTitle("Universities")
        }
    }
}

struct UniversityRowView: View {
    let university: University
    
    var body: some View {
        Button(action: {
            if let url = university.webPages.first, let actualUrl = URL(string: url) {
                UIApplication.shared.open(actualUrl)
            }
        }) {
            HStack(spacing: 16) {
                AsyncImage(url: URL(string: "https://c8.alamy.com/comp/2M06P83/100th-day-of-school-cartoon-colored-clipart-2M06P83.jpg")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if phase.error != nil {
                        // Handle error (optional)
                        Text("Failed to load image")
                    } else {
                        // Placeholder while loading
                        ProgressView()
                    }
                }
                .frame(width: 80, height: 100) // Adjust frame size here if needed
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(university.name)
                        .font(.headline)
                    
                    Text("Country: \(university.country)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    if let stateProvince = university.stateProvince {
                        Text("State/Province: \(stateProvince)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                Image(systemName: "heart")
                    .font(.title)
                    .padding(8)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .padding(.vertical, 8)
        }
        .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to remove default button style
    }
}

#Preview {
    CollegeUniversities()
}
