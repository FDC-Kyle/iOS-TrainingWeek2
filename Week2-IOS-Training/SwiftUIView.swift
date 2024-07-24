//
//  SwiftUIView.swift
//  Week2-IOS-Training
//
//  Created by FDC-KYLE-NC-WEB on 7/23/24.
//

import SwiftUI


struct SwiftUIView: View {
    let bannerImages = ["watermelon", "banner3", "banner2"]
    let products: [Product] = [
        Product(title: "Apple",
                description: "Sweet and juicy apple",
                price: "$1.99",
                image: URL(string: "data:image/png;base64,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")),
        Product(title: "Banana",
                description: "Yellow banana with potassium",
                price: "$0.99",
                image: URL(string: "data:image/png;base64,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")),
        Product(title: "Orange",
                description: "Fresh and tangy orange",
                price: "$2.49",
                image: URL(string: "data:image/png;base64,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")),
        Product(title: "Grape",
                description: "Plump and delicious grape",
                price: "$3.99",
                image: URL(string: "data:image/jpeg;base64,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")),
        Product(title: "Mango",
                description: "Exotic and tropical mango",
                price: "$4.99",
                image: URL(string: "https://static.vecteezy.com/system/resources/previews/015/846/068/original/mango-mango-on-white-background-logo-design-mango-cartoon-thailand-dessert-free-vector.jpg")),
        Product(title: "Pineapple",
                description: "Sweet and refreshing pineapple",
                price: "$3.49",
                image: URL(string: "https://t3.ftcdn.net/jpg/00/91/91/28/360_F_91912805_ulNEUfKTmE4VFFnTk3s0cKAxaWfKNZJ8.jpg")),
        Product(title: "Watermelon",
                description: "Juicy and hydrating watermelon",
                price: "$5.99",
                image: URL(string: "https://img.freepik.com/premium-vector/watermelon-color-vector-isolated-cartoonstyle-illustration-white-background_485992-379.jpg")),
        Product(title: "Strawberry",
                description: "Red and sweet strawberry",
                price: "$2.99",
                image: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGfstgGtL6nOecl8r96Y0t3-q_6WJf6hm43A&s")),
        Product(title: "Kiwi",
                description: "Tangy and nutritious kiwi",
                price: "$1.79",
                image: URL(string: "data:image/jpeg;base64,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")),
        Product(title: "Pear",
                description: "Crisp and juicy pear",
                price: "$2.29",
                image: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZubD4W1NJbIYmGwJdZ0PwiomBdZkfYcm5-A&s"))
    ]
    
    let columns = [
        GridItem(.adaptive(minimum: 180))]
    
    @State var isGrid = true
    
    var body: some View {
        VStack{
        HeaderView
        BannerView
            HStack{
                    Text("For you")
                    .font(.system(size: 20, weight: .bold))
                    Spacer()
                HStack{
                    HStack {
                        Button {
                            isGrid = false
                        } label: {
                            Image(systemName: "list.dash")
                                .foregroundColor(isGrid ? .gray : .blue)
                        }
                        .opacity(isGrid ? 1.0 : 0.5)
                        .disabled(isGrid ? false : true)
                        
                        Button {
                            isGrid = true
                        } label: {
                            Image(systemName: "rectangle.grid.2x2")
                                .foregroundColor(isGrid ? .blue : .gray)
                        }
                        .opacity(isGrid ? 0.5 : 1.0)
                        .disabled(isGrid ? true : false)
                    }
                    .padding(.horizontal, 10)
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            Divider()
            if isGrid{
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 20, content: {
                        ForEach(products){ product in
                            ProductItemView(product: product)
                            
                        }
                    })
                }
                .padding(.horizontal, 10)
                      .padding(.top, 10)
            }
            else{
                List {
                    ForEach(products) { product in
                        ProductRowView(product: product)
                            
                    }
                }
            }
        }
        .background(Color(red: 238/255, green: 238/255, blue: 239/255).opacity(1.0))
    }
    
    private var HeaderView: some View{
        HStack{
            VStack{
                Text("Your Balance")
                Text("$1,700.00")
                    .bold()
            }
            
            Spacer()
            Image(.eyan)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
        .padding([.leading, .trailing], 20)
    }
    
    private var BannerView: some View {
        VStack {
            TabView {
                ForEach(bannerImages, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }

}

struct Product: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let price: String
    let image: URL?
}

//horizontal scrolling naay image
struct ProductItemView: View {
    let product: Product
    @State private var showModal = false
    
    var body: some View {
        VStack {
            if let imageURL = product.image {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .background(Color.yellow)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .symbolRenderingMode(.multicolor)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .symbolRenderingMode(.multicolor)
                    .background(Color.yellow)
            }
            
            Text(product.title)
                .font(.caption)
        }
        .onTapGesture {
                   showModal.toggle() // Toggle modal state when tapped
               }
               .fullScreenCover(isPresented: $showModal) {
                   ProductDetailView(product: product)
               }
        .padding(10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
struct ProductRowView: View {
    let product: Product
    @State private var isFavorite = false
    @State private var showModal = false
    var body: some View {
        HStack {
            if let imageURL = product.image {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(Color.yellow)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .symbolRenderingMode(.multicolor)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .symbolRenderingMode(.multicolor)
                    .background(Color.yellow)
            }
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.title2)
                Text(product.description)
                    .foregroundStyle(.gray.opacity(0.7))
                    .font(.system(size: 13))
                Text(product.price)
                    .bold()
            }
   
            Spacer()
            Button(action: {
                            // Toggle favorite state
                            isFavorite.toggle()
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(isFavorite ? .red : .gray)
                        }
                        .buttonStyle(PlainButtonStyle())
            }
            
            .onTapGesture {
                       showModal.toggle() // Toggle modal state when tapped
                   }
                   .fullScreenCover(isPresented: $showModal) {
                       ProductDetailView(product: product)
                   }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ButtonWithAlert: View {
    let buttonLabel: String
    let alertTitle: String
    @Binding var showAlert: Bool
    
    var body: some View {
        Button(buttonLabel) {
            showAlert = true
        }
        .padding()
        .foregroundStyle(.white)
        
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: nil, dismissButton: .default(Text("OK")))
        }
    }
}

struct ProductDetailView: View {
    let product: Product
    @Environment(\.presentationMode) var presentationMode
    @State private var showSuccessMessage = false
    @State private var showMessage1 = false
    @State private var yOffset: CGFloat = .zero
    @State private var dragGestureOffset: CGSize = .zero
    
    var body: some View {
        VStack {
            if let imageURL = product.image {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250)
                            .background(Color.yellow)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .symbolRenderingMode(.multicolor)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .symbolRenderingMode(.multicolor)
                    .background(Color.yellow)
            }
            
            Text(product.title)
                .font(.title)
                .padding()
            
            Text(product.description)
                .font(.body)
                .padding()
            
            Text(product.price)
                .font(.headline)
                .padding()
            HStack(spacing: 10) {
                ButtonWithAlert(buttonLabel: "Buy Now", alertTitle: "Product Bought!", showAlert: $showSuccessMessage)
                    .background(.purple)
                    .bold()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                ButtonWithAlert(buttonLabel: "Add To Cart", alertTitle: "Added to Cart!", showAlert: $showMessage1)
                    .background(.orange)
                    .bold()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding(.top, 30)
        .offset(y: yOffset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            dragGestureOffset = gesture.translation
                        }
                        .onEnded { gesture in
                            if dragGestureOffset.height > 100 {
                                withAnimation {
                                    yOffset = UIScreen.main.bounds.height
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            } else {
                                dragGestureOffset = .zero
                            }
                        }
                )
    }
}


#Preview {
    SwiftUIView()
}
