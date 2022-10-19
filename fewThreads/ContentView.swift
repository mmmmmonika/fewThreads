//
//  ContentView.swift
//  fewThreads
//
//  Created by Monika Piesyk on 18/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Threads()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Threads: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> ThreadVC {
        return ThreadVC()
    }
    
    func updateUIViewController(_ uiViewController: ThreadVC, context: Context) {
        
    }
}


