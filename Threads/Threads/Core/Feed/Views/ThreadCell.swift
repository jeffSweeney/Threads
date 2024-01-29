//
//  ThreadCell.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/29/24.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("sweeney_jeff")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Text("iOS Developer by day, attempting to be an iOS developer by night.")
                        .font(.footnote)
                        .lineLimit(3)
                    
                    HStack(spacing: 16) {
                        Button(action: {
                            print("TAP: Like")
                        }, label: {
                            Image(systemName: "heart")
                        })
                        
                        Button(action: {
                            print("TAP: Reply")
                        }, label: {
                            Image(systemName: "bubble.right")
                        })
                        
                        Button(action: {
                            print("TAP: Repost")
                        }, label: {
                            Image(systemName: "arrow.rectanglepath")
                        })
                        
                        Button(action: {
                            print("TAP: Like")
                        }, label: {
                            Image(systemName: "paperplane")
                        })
                    }
                    .foregroundStyle(.black)
                    .padding(.vertical, 8)
                    
                    Text("2 likes")
                        .font(.caption)
                        .foregroundStyle(Color(.systemGray))
                }
                
                HStack {
                    Text("10m")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemGray))
                    
                    Button(action: {
                        print("TAP: Like")
                    }, label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(Color(.darkGray))
                    })
                }
            }
            
            Divider()
        }
        .padding(8)
    }
}

#Preview {
    ThreadCell()
}
