//
//  OtpBaseView.swift
//  Connectd
//
//  Created by Creative Sanctum on 2022/05/09.
//

import SwiftUI

struct OtpBaseView: View {
    
    @State var currentPage: Page = .page1
    
    var body: some View {
        
        switch currentPage {
           case .page1:
               OtpView()
           case .page2:
               OtpErrorView()
           }
        
    }
}

struct OtpBaseView_Previews: PreviewProvider {
    static var previews: some View {
        OtpBaseView()
    }
}
