//
//  RegisterView.swift
//  TopSecret
//
//  Created by Bruce Blake on 4/2/21.
//
//
//  LoginView.swift
//  TopSecret
//
//  Created by Bruce Blake on 4/2/21.
//

import SwiftUI

struct RegisterView: View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var password = ""
    @State var rePassword = ""
    @State var visible = false
    @State var reVisible = false
    var body: some View {
        ZStack(alignment: .topTrailing){
            GeometryReader{ _ in
                VStack{
                    Spacer()

                    Text("Create an account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                        .padding(.top, 55)
                    
                    
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color.purple : self.color, lineWidth: 2))
                        .padding(.top, 25)
                    
                    HStack(spacing: 15){
                        
                        VStack{
                            if self.visible {
                                TextField("Password", text: self.$password)
                            }else{
                                SecureField("Password", text: self.$password)
                                
                            }
                            
                        }
                        
                        Button(action: {
                            self.visible.toggle()
                        }, label: {
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(self.color)
                        })
                    }.padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color.purple : self.color, lineWidth: 2))
                    .padding(.top, 25)
                    
                    HStack(spacing: 15){
                        
                        VStack{
                            if self.reVisible {
                                TextField("Password", text: self.$rePassword)
                            }else{
                                SecureField("Password", text: self.$rePassword)
                                
                            }
                        }
                        
                        Button(action: {
                            self.reVisible.toggle()
                        }, label: {
                            Image(systemName: self.reVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(self.color)
                        })
                    }.padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.rePassword != "" ? Color.purple : self.color, lineWidth: 2))
                    .padding(.top, 25)
                    

                    
                    
                    
                    HStack{
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Forgot Password?")
                                .fontWeight(.bold)
                                .foregroundColor(Color.purple)
                                .font(.system(size: 12))
                        })
                    }
                    .padding(.bottom,35)
                    
                    Button(action: {
                        
                    },label: {
                        Text("Log In")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    })
                    .background(Color.purple)
                    .cornerRadius(10)
                    .padding(.top,25)
                    
                    Spacer()
                    
                }
                .padding(.horizontal,25)
            }
            Button(action: {
                
            },label: {
                Text("Register")
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
            }).padding()
        }
    }
}
