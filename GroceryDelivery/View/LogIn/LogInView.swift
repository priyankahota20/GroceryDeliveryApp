//
//  LogInView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/25/23.
//

import SwiftUI

struct LogInView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    
    @State private var isEmailValid : Bool   = true
    @State private var emailString  : String = ""
    @State private var isPresented = false
    
    @State private var showingLoginScreen = false
    @State var showAlert: Bool = false
    
    var body: some View {
        
            VStack{
                LoginBannerView()
                VStack {
                    HStack {
                        Text("Email")
                            .padding(20)
                        Spacer()
                    }
                    
                    
                    //MARK: Email TextField
                    TextField("", text: $username, onEditingChanged: { (isChanged) in
                        
                        
                    })
                    
                    .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                    .background(Color.black.opacity(0.05))
                    
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongUsername))
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.vertical, -10)
                }
                
                VStack {
                    HStack {
                        Text("Password")
                            .padding(20)
                        Spacer()
                    }
                    
                    //MARK: Password TextField
                    SecureField("", text: $password)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .padding(.vertical, -10)
                    
                    HStack {
                        Spacer()
                        Button("Forgotten Password"){
                            
                        }
                        .font(.system(size: 12))
                        .foregroundColor(Color.blue)
                        .padding()
                        .offset(x: -10, y: 0)
                        
                    }
                }
                
                VStack {
                    
                    //MARK: Log in Button Action
                    Button(action: {
                          print("Login Button Tapped")
                        isPresented.toggle()
                    }) {
                        Text("Log in")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                            .background(Color.init(red: 2.0/255.0, green: 152.0/255.0, blue: 80.0/255.0))
                            .cornerRadius(10)
                            .padding([.bottom], 20)
                            .fullScreenCover(isPresented: $isPresented, content: TabBarView.init)

                    }
                    
                    //MARK: Create an Account Button Action
                    Button("Create an account") {
                        showAlert.toggle()
                    }
                    .foregroundColor(Color.black)
                    .padding(10)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Create Account"))
                    }
                }
            }
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
