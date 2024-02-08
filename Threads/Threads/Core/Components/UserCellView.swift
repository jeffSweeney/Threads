//
//  UserCellView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/29/24.
//

import SwiftUI

struct UserCellView: View {
    let user: User
    
    var body: some View {
        HStack {
            CircularProfileImageView()
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
            }
            .font(.footnote)
            
            Spacer()
            
            Button(action: {
                print("TAPPED: Follow")
            }, label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
            })
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCellView(user: User.MOCK_USER)
}
