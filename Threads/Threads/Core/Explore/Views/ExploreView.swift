//
//  ExploreView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/28/24.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = ExploreViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack(spacing: 12) {
                                UserCellView(user: user)
                                
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .navigationDestination(for: User.self, destination: { user in
                ProfileView()
            })
            .searchable(text: $searchText, prompt: "Search ...")
        }
    }
}

#Preview {
    ExploreView()
}
