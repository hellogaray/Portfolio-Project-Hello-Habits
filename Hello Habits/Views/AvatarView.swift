//
//  AvatarView.swift
//  Hello Habits
//
//  Created by Leonel Garay on 12/4/23.
//

import SwiftUI

struct AvatarView: View {
    var body: some View {
        // Display user avatar image
        Image("ellieavatar")
            .resizable()
            .frame(width: 140, height: 140)
            .clipShape(Circle())
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview the AvatarView
        AvatarView()
            .previewLayout(.sizeThatFits)
    }
}
