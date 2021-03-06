//
//  LoginView.swift
//  TopSecret
//
//  Created by Bruce Blake on 4/2/21.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel : UserAuthViewModel
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @State var showForgotPassword = false
    @Binding var showRegisterView: Bool
    var body: some View {
        ZStack(alignment: .topTrailing){
            Color.themeBackground
                .ignoresSafeArea(.all)
           
            GeometryReader{ _ in
               
                
                VStack{
                    
                    
                    Spacer()

                    Text("Log in to your account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.themeForeground)
                        .padding(.top, 55)
                    
                    
                    TextField("Email", text: self.$email)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color.themeForeground : self.color, lineWidth: 2))
                        .padding(.top, 25)
                    ZStack{
                        if viewModel.startingLoggingIn{
                            ProgressView()
                        }
                    }
                    
                    HStack(spacing: 15){
                        
                        VStack{
                            if self.visible {
                                TextField("Password", text: self.$password)
                                    .autocapitalization(.none)
                            }else{
                                SecureField("Password", text: self.$password)
                                    .autocapitalization(.none)
                                
                            }
                        }
                        
                        Button(action: {
                            self.visible.toggle()
                        }, label: {
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(Color.themeForeground)
                        })
                    }.padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color.themeForeground : self.color, lineWidth: 2))
                    .padding(.top, 25)
                    
                    
                    HStack{
                        Spacer()
                        
                        Button(action: {
                            self.showForgotPassword.toggle()
                        }, label: {
                            Text("Forgot Password?")
                                .fontWeight(.bold)
                                .foregroundColor(Color.themeAccent)
                                .font(.system(size: 12))
                        })
                    }
                    .padding(.bottom,35)
                    
                    Button(action: {
                        if(self.email != "" && self.password != ""){
                        viewModel.signIn(withEmail: email, password: password)
                        }
                    },label: {
                        Text("Log In")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    })
                    .background(Color.themeAccent)
                    .cornerRadius(10)
                    .padding(.top,25)
                    
                    Spacer()
                    
                }
                .padding(.horizontal,25)
            }
            Button(action: {
                showRegisterView.toggle()
                viewModel.startingRegistering = false
            },label: {
                Text("Register")
                    .fontWeight(.bold)
                    .foregroundColor(Color.themeAccent)
            }).padding()
        }
        

    }
}

