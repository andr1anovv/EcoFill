//
//  FeedbackScreen.swift
//  EcoFill
//
//  Created by Alexander Andrianov on 10.12.2023.
//

import SwiftUI

enum FeedbackFormTextField {
  case email, message
}

struct SupportScreen: View {
  
  // MARK: - properties
  @EnvironmentObject var authenticationVM: AuthenticationViewModel
  @FocusState private var focusedFeedbackTF: FeedbackFormTextField?
  @State private var email: String = ""
  @State private var message: String = ""
  @State private var isPresentedAlert = false
  
  // MARK: - body
  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 10) {
        
        VStack(alignment: .leading, spacing: 20) {
          CustomTextField(inputData: $email,
                          title: "Email",
                          placeholder: "Write your email address.")
          .focused($focusedFeedbackTF, equals: .email)
          .submitLabel(.next)
          .onSubmit { focusedFeedbackTF = .message }
          .keyboardType(.emailAddress)
          .textInputAutocapitalization(.never)
          .autocorrectionDisabled(true)
          
          CustomTextField(inputData: $message,
                          title: "Message",
                          placeholder: "Must contain at least 10 characters.")
          .focused($focusedFeedbackTF, equals: .message)
          .onSubmit { focusedFeedbackTF = nil }
          .submitLabel(.done)
          
          SendFeedbackBtn {
            isPresentedAlert = true
            message = ""
          }
          .disabled(!isValidForm)
          .opacity(isValidForm ? 1.0 : 0.5)
          
          .alert("Thanks for your feedback", isPresented: $isPresentedAlert) {
            //
          } message: {
            Text("Your feedback message has been sent successfully.")
          }
        }
        .padding()
        
        VStack(alignment: .leading, spacing: 3) {
          Text("Call our hotline:")
            .font(.footnote)
            .foregroundStyle(.gray)
          
          ScrollableHotlineNumbers()
        }
        .padding()
        
        Spacer()
      }
      .navigationTitle("Support")
      .navigationBarTitleDisplayMode(.inline)
      .onAppear {
        if let userEmail = authenticationVM.currentUser?.email {
          email = userEmail
        } else {
          email = "No email"
        }
      }
    }
  }
}

// MARK: - extensions

extension SupportScreen: AuthenticationForm {
  var isValidForm: Bool {
    return message.count > 9
  }
}
