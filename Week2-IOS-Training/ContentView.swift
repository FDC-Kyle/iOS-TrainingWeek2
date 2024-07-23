//
//  ContentView.swift
//  Week2-IOS-Training
//
//  Created by FDC-KYLE-NC-WEB on 7/22/24.
//

import SwiftUI

struct ThumbnailView: View {
    let imageName: ImageResource
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

struct ItineraryItem: Identifiable {
    let id = UUID()
    let imageName: ImageResource
    let title: String
    let description: String
    let time: String
}

struct ItineraryItemView: View {
    let imageName: ImageResource
    let title: String
    let description: String
    let time: String

    var body: some View {
        HStack(alignment: .top) {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .padding(16)
                .background(Color.cyan.opacity(0.13))
                .clipShape(RoundedRectangle(cornerRadius: 6))

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .bold()
                Text(description)
                    .multilineTextAlignment(.leading) // Ensure multiline text alignment
                    .fixedSize(horizontal: false, vertical: true) // Allow multiline text
            }

            Spacer()

            Text(time)
                .padding(.top, 6)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading) // Ensure entire width alignment
        .padding(.vertical, 8) // Adjust vertical padding as needed
    }
}

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 30)
                Button("←"){
                    
                }
                
                .padding(.leading, 5)
                .padding(.top, 20)
                .font(.system(size: 25))
                .foregroundStyle(.white)
                .bold()
                .ignoresSafeArea()
                
                Spacer()
                    .frame(height: 20)
                // Horizontal "iOS Dev"
                Text("iOS Dev")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
                    .bold()
                    .zIndex(1) // Ensure it's above other views
                
                Text("Day 1 Training")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                Text("22 - 26 July 2024")
                    .foregroundStyle(.white.opacity(0.7))
                
                Spacer()
                    .frame(height: 110)
                
                HStack(spacing: -6){
                    ThumbnailView(imageName: .eyan)
                    ThumbnailView(imageName: .glynvile)
                    ThumbnailView(imageName: .eyan1)
                    
                    Spacer()
                    Button("✓ You Joined"){
                        
                    }
                    .padding([.top, .bottom], 10)
                    .padding([.leading, .trailing], 20)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                Spacer()
            }
            .padding(20)
            .background(Color.cyan)
            ItineraryView()
                .frame(height: 300)
            
            VStack {
                Spacer()
                Text("iOS Dev")
                    .font(.system(size: 60))
                    .foregroundStyle(.white.opacity(0.25))
                    .bold()
                    .rotationEffect(.degrees(-90))
                    .frame(maxHeight: .infinity, alignment: .topTrailing)
                    .fixedSize() // Ensure the text doesn't wrap
                    .padding(.leading, -475) // Adjust padding to position along the edge
                    .padding(.bottom, 695)
                    .zIndex(0) // Ensure it's behind other views
            }
        }
        .ignoresSafeArea()
    }
}


struct ItineraryView: View {
    let itineraryItems: [ItineraryItem] = [
        ItineraryItem(imageName: .icon2, title: "Million Dollar Baby", description: "I ain't never rep a set, baby, I ain't do no wrong", time: "2:00 PM"),
        ItineraryItem(imageName: .icon2, title: "Heaven Knows", description: "She's always on my mind From the time I wake...", time: "2:30 PM"),
        ItineraryItem(imageName: .icon2, title: "Pantropiko", description: "Feels like summer when i'm with you parang...", time: "5:00 PM")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text("⎯⎯⎯")
                .font(.system(size: 30))
                .padding(.leading, 135)
                .padding(.top, -30)
                .opacity(0.25)
            Text("Songs")
                .font(.title2)

            ForEach(itineraryItems) { item in
                ItineraryItemView(imageName: item.imageName,
                                  title: item.title,
                                  description: item.description,
                                  time: item.time)
            }
            HStack {
                Spacer()
                Button("+") {
                    
                }
                .frame(width: 20, height: 20)
                .font(.system(size: 30))
                .padding(20)
                .foregroundColor(.white)
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }

            Spacer()
                .frame(height:100)
        }
        .padding(20)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ContentView()
}


