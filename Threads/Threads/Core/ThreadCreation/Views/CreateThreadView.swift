//
//  CreateThreadView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/28/24.
//

import SwiftUI

struct CreateThreadView: View {
    @State private var caption = ""
    @Binding var tabIndex: Int
    
    var body: some View {
        NavigationStack { // Pro-tip: Not navigating. Just getting toolbar functionality for free.
            VStack {
                Divider()
                HStack(alignment: .top) {
                    CircularProfileImageView()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("sweeney_jeff")
                            .fontWeight(.semibold)
                        
                        HStack(alignment: .top) {
                            TextField("Start a thread ...", text: $caption, axis: .vertical)
                            
                            Spacer()
                            
                            if !caption.isEmpty {
                                Button(action: {
                                    caption = ""
                                }, label: {
                                    Image(systemName: "xmark")
                                        .imageScale(.medium)
                                        .foregroundStyle(.gray)
                                })
                            }
                        }
                    }
                    .font(.footnote)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        tabIndex = ThreadsTabView.DEFAULT_TAB
                    }, label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                    })
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // TODO: Upload post
                        tabIndex = ThreadsTabView.DEFAULT_TAB
                    }, label: {
                        Text("Post")
                            .opacity(caption.isEmpty ? 0.5 : 1.0)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    })
                    .disabled(caption.isEmpty)
                }
            }
        }
    }
}

#Preview {
    CreateThreadView(tabIndex: .constant(2))
}
