//
//  ContentView.swift
//  iosmvvm
//
//  Created by Macbook on 29.05.1444 (AH).
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.timeZone)
                    .font(.system(size: 32))
                    .foregroundColor(.black)
                Text(viewModel.temp)
                    .font(.system(size: 44))
                    .padding(10)
                    .foregroundColor(.black)
                Text(viewModel.title)
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                Text(viewModel.description)
                    .font(.system(size: 24))
                    .foregroundColor(.black)
            }
        }.navigationTitle("First ios app").foregroundColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
