//
//  SymbolDetails.swift
//  SF Symbols
//
//  Created by 吕阳 on 2020/1/1.
//  Copyright © 2020 Fade. All rights reserved.
//

import SwiftUI

struct SymbolDetails: View {
	var symbol: String
    var body: some View {
		VStack {
			Image(systemName: symbol)
				.resizable()
				.scaledToFit()
				.frame(height: 200)
			Text(symbol)
				.font(.title)
				.lineLimit(2)
				.multilineTextAlignment(.center)
				.frame(maxWidth: UIScreen.main.bounds.width - 40)
		}
		.navigationBarTitle(Text(symbol), displayMode: .inline)
    }
}

struct SymbolDetails_Previews: PreviewProvider {
    static var previews: some View {
		SymbolDetails(symbol: "questionmark")
    }
}
