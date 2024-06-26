//
//  DismissXButton.swift
//  EcoFill
//
//  Created by Alexander Andrianov on 09.03.2024.
//

import SwiftUI

struct DismissXBtn: View {
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    Button {
      dismiss()
    } label: {
      Image(.xmark)
        .defaultSize()
    }
  }
}
