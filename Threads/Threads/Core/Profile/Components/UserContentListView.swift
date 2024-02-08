//
//  UserContentListView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 2/8/24.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(isSelectedFilter(filter) ? .semibold : .regular)
                        
                        if isSelectedFilter(filter) {
                            Rectangle()
                                .foregroundStyle(.black)
                                .frame(width: 180, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: 180, height: 1)
                        }
                        
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedFilter = filter
                        }
                    }
                }
            }
            
            if isSelectedFilter(.threads) {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { thread in
                        ThreadCell()
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }
}

extension UserContentListView {
    fileprivate func isSelectedFilter(_ filter: ProfileThreadFilter) -> Bool {
        return filter == selectedFilter
    }
}

#Preview {
    UserContentListView()
}
