//
//  ProfileView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/28/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(viewModel.currentUser?.fullname ?? "DEBUG: USER UNKNOWN")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("sweeney_jeff")
                                    .font(.subheadline)
                            }
                            
                            Text("Aspiring pilot, current iOS developer!")
                                .font(.footnote)
                            
                            Text("2 followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        CircularProfileImageView()
                    }
                    
                    Button(action: {
                        print("TAPPED: Follow button")
                    }, label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 352, height: 32)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    
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
            .scrollIndicators(.hidden)
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }

                }
            }
        }
    }
}

extension ProfileView {
    fileprivate func isSelectedFilter(_ filter: ProfileThreadFilter) -> Bool {
        return filter == selectedFilter
    }
}

#Preview {
    ProfileView()
}
