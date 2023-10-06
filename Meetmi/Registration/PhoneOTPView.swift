//
//  PhoneOTPView.swift
//  Meetmi
//
//  Created by Dale Banda on 2023/10/06.
//

import Foundation
import SwiftUI
import Firebase
//import FirebaseAuth


struct PhoneOTPView: View {
    @State private var phoneNumber = ""
    @State private var verificationCode = ""
    @State private var verificationID: String?
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            TextField("Phone Number", text: $phoneNumber)
                .keyboardType(.phonePad)
                .padding()
            
            Button(action: {
                sendVerificationCode()
            }) {
                Text("Send Verification Code")
            }
            
            TextField("Verification Code", text: $verificationCode)
                .keyboardType(.numberPad)
                .padding()
            
            Button(action: {
                verifyCode()
            }) {
                Text("Verify Code")
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    private func sendVerificationCode() {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if let error = error {
                self.alertMessage = "Error: \(error.localizedDescription)"
                self.showAlert = true
            } else {
                self.verificationID = verificationID
            }
        }
    }

    private func verifyCode() {
        guard let verificationID = verificationID else {
            self.alertMessage = "Verification ID is missing."
            self.showAlert = true
            return
        }

        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                self.alertMessage = "Error: \(error.localizedDescription)"
                self.showAlert = true
            } else {
                self.alertMessage = "Phone number verified successfully."
                self.showAlert = true
            }
        }
    }
}

