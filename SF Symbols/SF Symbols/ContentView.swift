//
//  ContentView.swift
//  SF Symbols
//
//  Created by 吕阳 on 2020/1/1.
//  Copyright © 2020 Fade. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var searchText = ""
	@State private var showSearch = false
    var body: some View {
		NavigationView {
			VStack {
				if showSearch{
					SearchBar(searchText: $searchText)
						.padding(.horizontal)
				}
				List(symbols.filter{$0.hasPrefix(searchText.lowercased())},
					 id: \.self){ symbol in
					NavigationLink(destination: SymbolDetails(symbol: symbol)){
						SymbolCell(symbol: symbol)
					}
				}
				.id(UUID())
			}
			.navigationBarTitle("SF Symbols")
			.navigationBarItems(trailing:
				Button(action: {
					self.showSearch.toggle()
				}) {
					Image(systemName: "magnifyingglass")
						.foregroundColor(.secondary)
				}
				.padding()
			)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ContentView()
				.preferredColorScheme(.dark)
			ContentView()
				.preferredColorScheme(.light)
		}
    }
}

struct SearchBar: View {
	@Binding var searchText: String
	var body: some View {
		ZStack {
			Capsule()
				.frame(height: 35)
				.foregroundColor(.gray)
			HStack {
				Image(systemName: "magnifyingglass")
				TextField("Search", text: $searchText)
				if !searchText.isEmpty{
					Button(action: {
						self.searchText = ""
					}){
						Image(systemName: "xmark.circle")
							.foregroundColor(.black)
					}
				}
			}
			.padding([.leading, .trailing])
		}
	}
}

struct SymbolCell: View {
	var symbol: String
	var body: some View {
		HStack {
			Image(systemName: symbol)
				.frame(width: 32, height: 32)
			Text(symbol)
				.font(.headline)
				.bold()
		}
	}
}
