//
//  NewsArticleView.swift
//  StocksApp
//
//  Created by Yusuf Turan on 24.05.2021.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
  let newsArticles: [NewsArticleViewModel]
  var body: some View {
    let screenSize = UIScreen.main.bounds.size
    return VStack(alignment: .leading) {
      VStack(alignment: .leading) {
        Text("Top News")
          .foregroundColor(.white)
          .font(.largeTitle)
          .fontWeight(.bold)
          .padding(2)
        Text("From Apple")
          .foregroundColor(.gray)
          .font(.body)
          .fontWeight(.bold)
          .padding(2)
        
        ScrollView {
          VStack {
            ForEach(self.newsArticles, id: \.title) { article in
              HStack {
                VStack(alignment: .leading) {
                  Text(article.publication)
                    .foregroundColor(.white)
                    .font(.custom("Arial", size: 22))
                    .fontWeight(.bold)
                  Text(article.title)
                    .foregroundColor(.white)
                    .font(.custom("Arial", size: 22))
                }
              }
              Spacer()
              
              URLImage(URL(string: article.imageURL)!) { image in
                image.resizable().scaledToFit()
              }
            }
          }
          .frame(maxWidth: .infinity)
        }
      }
    }
    .frame(width: screenSize.width, height: screenSize.height)
    .background(Color(red: 27/255, green: 28/255, blue: 30/255))
    .cornerRadius(20)
  }
}

struct NewsArticleView_Previews: PreviewProvider {
  static var previews: some View {
    let article = Article(
      title: "The Bull Market is Charging into 2020",
      imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg",
      publication: "The Wallstreet Journal"
    )
     return NewsArticleView(newsArticles: [NewsArticleViewModel(article: article)])
  }
}
