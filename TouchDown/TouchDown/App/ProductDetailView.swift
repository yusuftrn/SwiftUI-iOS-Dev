//
//  ProductDetailVİew.swift
//  TouchDown
//
//  Created by Yusuf Turan on 6.05.2021.
//

import SwiftUI

struct ProductDetailView: View {
  
  @EnvironmentObject var shop: Shop
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5, content: {
      // NAVBAR
      NavigationBarDetailView()
        .padding(.horizontal)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
      
      // HEADER
      HeaderDetailView()
        .padding(.horizontal)
      
      // DETAIL TOP PART
      TopPartDetailView()
        .padding(.horizontal)
        .zIndex(1)
      
      // DETAIL BOTTOM PART
      VStack(alignment: .center, spacing: 0, content: {
        
        // RATING AND SIZES
        RatingSizesDetailView()
          .padding(.top, -20)
          .padding(.bottom, 10)
        
        // DESCRIPTION
        ScrollView(.vertical, showsIndicators: false) {
          Text(shop.selectedProduct?.description ?? sampleProduct.description)
            .font(.system(.body, design: .rounded))
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
        }
        
        // QUANTITY AND FAVOURITE
        QuantityFavouriteDetailView()
          .padding(.vertical, 10)
        
        
        
        // ADD TO CART
        AddToCartDetailView()
          .padding(.bottom, 20)
        
        Spacer()
      })
      .padding()
      .background(
        Color.white
          .clipShape(CustomShape())
          .padding(.top, -115)
      )
    })
    .zIndex(0)
    .ignoresSafeArea(.all, edges: .all)
    .background(
      Color(
        red: shop.selectedProduct?.red ?? sampleProduct.red, green: shop.selectedProduct?.green ?? sampleProduct.green, blue: shop.selectedProduct?.blue ?? sampleProduct.blue
      ).ignoresSafeArea(.all, edges: .all)
    )
  }
}

struct ProductDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ProductDetailView()
      .environmentObject(Shop())
      .previewLayout(.fixed(width: 375, height: 812))
  }
}
