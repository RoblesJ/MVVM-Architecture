//
//  ContentView.swift
//  StocksAppSwiftUI
//
//  Created by Julio Ismael Robles on 27/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm: String = ""
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = .black
        UITableView.appearance().separatorStyle = .none
        //        UITableView.appearance().separatorColor = .black
        stockListVM.load()
    }
    
    var body: some View {
        
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ?
            self.stockListVM.stocks : self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm) }
        
        return NavigationView {
            
            ZStack(alignment: .leading) {
                
                Color.black
                    .ignoresSafeArea()
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 120, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -400)
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -290)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 200)
                
                NewsArticleView(newsArticles: self.stockListVM.news,
                                onDragBegin: { value in
                                    self.stockListVM.dragOffset = value.translation
                                }, onDragEnd: { value in
                                    if value.translation.height < 0 {
                                        self.stockListVM.dragOffset = CGSize(width: 0, height: 100)
                                    } else {
                                        self.stockListVM.dragOffset = CGSize(width: 0, height: 680)
                                    }
                                })
                    .animation(.spring())
                    .offset(y: self.stockListVM.dragOffset.height)
                
                
                
            }
            
            
            .navigationBarTitle("Stocks")
        }.ignoresSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

