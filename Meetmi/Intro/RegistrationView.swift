//
//  RegistrationView.swift
//  Connectd
//
//  Created by Creative Sanctum on 2022/01/25.
//

import SwiftUI
import Firebase
import CountryPicker
import UIKit

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct RegistrationView: View {
    
    @StateObject var viewModel = ViewModel()
    
    
    
    @State private var fullname: String = ""
    
    @State private var cellnumber: String = ""
    
    @State private var dob: String = ""
    
    @State var selection: Int? = nil
    
    @State var text: String? = nil
    
    @State var calendarId: UUID = UUID()
        @State var someday: Date = Date()
    
    @State var selectedDate = Date()
    
    @State private var birthDate2 : Date = Calendar.current.date(byAdding: DateComponents(year: -4), to: Date()) ?? Date()
    
    var semaphore = DispatchSemaphore (value: 0)
    
    @State private var mhzValue : String = ""
 
    @State var searchedText: String = ""
    
    @State private var country: Country?
    
    @State private var showCountryPicker = false
    
    @EnvironmentObject var usersettings: UserSettings
    
    let countryPicker = CountryPickerViewController()
    
    @State private var isActive = false
    
    @State var checkState = false
    
    @State var isbd = false
    
    
    @EnvironmentObject var viewmodel: OnConnectdViewModel
    
    @State private var birthDate: Date = Calendar.current.date(byAdding: DateComponents(year: -4), to: Date()) ?? Date()
    
  
 //   @State private var isOtp = false
   
    
    
    
    init() {
            
        }
    
    /*

    init(){
        
           UITableView.appearance().backgroundColor = .clear
        
       }
     */

    
    var body: some View {
        
        
        
        
        if(isActive){
            
          OtpView()
                .navigationBarTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
               
            
            
            
        }
        
        
        else{
            
            ZStack{
                
              
                
                Image("Registering-1")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                 
                 
                    Image("Path1")
                        .offset(x: 0, y: 70)
                        .onTapGesture {
                            
                          //  sendotp()
                            
                        }
                    
                    
                    VStack(spacing: 20){
                        
                        Text("CONNECTD")
                            .font(Font.custom("Roboto-Bold", size: 30))
                            .foregroundColor(Color("appgreen"))
                            .offset(x: 0, y: 15)
                        
                        
                        Text("CREATE ACCOUNT")
                            .font(Font.custom("Roboto-Bold", size: 24))
                            .foregroundColor(.white)
                        
                        
                        Text("Fill in your details below to register and GetConnectd")
                            .font(Font.custom("Roboto-Regular", size: 14))
                            .foregroundColor(.white)
                        
                        
                       
                    }.offset(x: 0, y: 50)
                    
                 
                    Spacer()
                
                    //start
                
                }
                
                VStack(spacing: 20){
                    
                    HStack{
                        
                        Image("user-1")
                            .renderingMode(.template)
                                .foregroundColor(Color.blue)
                        
                        TextField("FullName", text: $fullname)
                            .font(Font.custom("Roboto-Regular", size: 16))
                        
                        
                    }.padding()
                        .background(Color.white)
                        .cornerRadius(30)
                        .frame(maxWidth:340, maxHeight: 50)
                        .offset()
                    
                    
                    HStack{
                        
                        Image("Phone")
                            .renderingMode(.template)
                            .foregroundColor(Color.blue)
                        
                      
                                  Button {
                                      
                                      showCountryPicker = true
                                      
                                    
                                      
                                  } label: {
                                      
                                      HStack(spacing:0){
                                          
                                          Text("+")
                                              .offset(x: 30, y: 0)
                                          TextField("Country", text:$viewModel.code)
                                              .font(Font.custom("Roboto-Regular", size: 16))
                                              .disabled(true)
                                      }
                                    
                                      
                                          .foregroundColor(Color.gray)
                                  }.sheet(isPresented: $showCountryPicker) {
                                      
                                      CountryPicker(country: $country).onDisappear() {
                                          
                                          let selectedcountry = country?.phoneCode
                                          
                                          if (selectedcountry != nil){
                                              
                                              self.usersettings.countrycode = "\(selectedcountry!)"
                                               
                                            
                                            //   $viewModel.code = "\(selectedcountry!)"
                                               
                                               self.viewModel.code = "\(selectedcountry!)"
                                          }
                                           
                                        
                                       
                                      }
                                      
                                      
                                     
                                    //
                                     
                                      
                                  }
                      
                        
                        TextField("Cell Number", text: $viewModel.phoneNumber)
                            .keyboardType(.decimalPad)
                            .font(Font.custom("Roboto-Regular", size: 16))
                           
                        
                        
                    }.padding()
                        .background(Color.white)
                        .cornerRadius(30)
                        .frame(maxWidth:340, maxHeight: 50)
                    
                    
                    if (!viewmodel.ismarkedfinal){
                        
                        
                        HStack{
                            
                            
                            
                            Image("calendar")
                                .renderingMode(.template)
                                .foregroundColor(Color.blue)
                            
                          
                            
                            VStack {
                                
                                
                                        DatePicker("Date of Birth",selection: $birthDate, in: ...Date(), displayedComponents: .date)
                                
                               
                               
                                        
                                
                                    }
                            
                            
                        }.padding()
                            .background(Color.white)
                            .cornerRadius(30)
                            .frame(maxWidth:340, maxHeight: 50)
                        
                    }
                    
                    
                    
                    
                    HStack(){
                        
                        VStack {
                            CheckboxField(
                                id: Check.dontshare.rawValue,
                                label: "",
                                size: 14,
                                textSize: 14,
                                callback: checkboxSelected
                                
                            )
                          
                        }.foregroundColor(.white)
                            .offset(x: 120)
                            .onTapGesture {
                                
                                isbd = false
                            }
                        
                        
                        Text("Prefer not to share")
                                   // .font(Font.headline)
                                    .font(Font.custom("Roboto-Regular", size: 14))
                                    .foregroundColor(.white)
                                    .offset(x: -90)
                    }
                   
                  
                    
                        
                        Text("NEXT")
                        
                            .foregroundColor(.white)
                            .frame(maxWidth:340, maxHeight: 50)
                            .font(Font.custom("Roboto-Bold", size: 17))
                            .background(Color("appgreen"))
                            .cornerRadius(30)
                            .onTapGesture {
                                
                                
                                if (!(fullname.isEmpty || viewModel.phoneNumber.isEmpty||viewModel.code.isEmpty || birthDate >= birthDate2)){
                                    
                                    
                                    isActive = true
                                                             
                                                          
                                                             //set user defaults
                                                             
                                                             let defaults = UserDefaults.standard
                                                             
                                                             defaults.set(fullname, forKey: "fullname")
                                                             
                                                             defaults.set(viewModel.phoneNumber, forKey: "cellphone")
                                                             
                                                             defaults.set(viewModel.code, forKey: "code")
                                                             
                                                             
                                                             let dateFormatter = DateFormatter()

                                                             // Set Date Format
                                                             dateFormatter.dateFormat = "dd-MM-YYYY"
                                                             
                                                             

                                                             // Convert Date to String
                                                             let dob =  dateFormatter.string(from: birthDate)
                                    
                                    
                                                             
                                                             defaults.set(dob, forKey: "bdae")
                                    
                                    
                                    if (viewmodel.ismarkedfinal){
                                        
                                        defaults.set("", forKey: "bdae")
                                        
                                        viewModel.sendCode()
                                        
                                    }else{
                                        
                                        defaults.set(dob, forKey: "bdae")
                                    }
                                                             
                                                             //for chats other user name
                                                             defaults.set("", forKey: "username")
                                                             
                                                            
                                                             
                                                             viewModel.sendCode()
                                    
                                }
                                
                                
                                
                                else {
                                    
                                    isbd = true
                                    
                                }
                              
                         
                                
                           
                                                         
                                                     }
                        
                                
                                
                    if(isbd){
                        
                        /*
                        Text("Please Enter valid birthday or prefer not to share")
                           .foregroundColor(.red)
                         */
                         
                        Text("").onAppear(){
                            isActive = true
                            
                            let defaults = UserDefaults.standard
                            defaults.set(fullname, forKey: "fullname")
                            
                        viewModel.sendCode()
                            
                            
                        }
                        
                    }
                 
                   
                      
               
          
                    VStack(spacing:10){
                        
                        Text("By registering on this app, you agree to the ")
                            .font(.system(size: 13))
                            .foregroundColor(Color.white)
                        
                       
                       
                        Button(action: {
                            if let url = URL(string: "https://www.getconnectd.app/app-terms-conditions/") {
                               UIApplication.shared.open(url)
                            }
                        }) {
                            Text("Terms, Conditions and End-User License Agreement. ")
                                .font(.system(size: 13))
                                .foregroundColor(Color.blue)
                                .padding(.trailing)
                        }
                        
                       
                    }
            
                }.offset(y: 85)
                  
           
                
            } .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .offset(x: 0, y: 10)
       
            
            .onAppear(){
                
               
              
            }
            .onTapGesture {
                
                self.hideKeyboard()
            }

            
        }
           
               
 
    }
    
  
    func checkboxSelected(id: String, isMarked: Bool) {
           print("\(id) is marked: \(isMarked)")
       }
    

}
    
 
    
    


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

struct CheckboxField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: Int
    let callback: (String, Bool)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 10,
        color: Color = Color.black,
        textSize: Int = 14,
        callback: @escaping (String, Bool)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.callback = callback
    }
    
    @State var isMarked:Bool = false
    
    @EnvironmentObject var viewmodel: OnConnectdViewModel
    
    var body: some View {
        
        Button(action:{
            self.isMarked.toggle()
            self.callback(self.id, self.isMarked)
            
                viewmodel.ismarkedfinal  = self.isMarked
            
         
            
            
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "checkmark.square" : "square")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(Font.system(size: size))
                Spacer()
            }.foregroundColor(.white)
        }
        .foregroundColor(Color.white)
    }
}

enum Check: String {
    case dontshare
    
}
