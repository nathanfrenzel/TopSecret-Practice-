//
//  RegisterUsernameView.swift
//  TopSecret
//
//  Created by Bruce Blake on 4/12/21.
//

import SwiftUI

struct RegisterUsernameView : View {
    
    @EnvironmentObject var viewModel : UserAuthViewModel
    
    @State var availableImage = ""
    @Binding var email: String
    @Binding var password: String
    @State var username = ""
    @State var goNext = false
    @State var color = Color.themeForeground
    @State var isChecking = false
    
   
    
    
    func checkUsername(){
        isChecking = true
      viewModel.checkIfUsernameAvailable(username: username) { (available) in
          if available && username != ""{
              availableImage = "checkmark"
              color = Color.green
          }else {
              availableImage = "xmark"
              color = Color.red
          }
      }
  }
    
     
    var body: some View{
        ZStack{
            
          
            Color.themeBackground
                .ignoresSafeArea(.all)
            VStack{
                
                
                Text("Please pick a Unique Username!")
                    .fontWeight(.bold)
                    .foregroundColor(Color.themeForeground)
                    .padding(.top, 55)
                
              
                
                //username shit
                HStack(spacing: 15){
                    
                    TextField("Username", text: self.$username)
                        .onChange(of: username) { (check) in
                            checkUsername()
                        }
                    
                        
                    
                    Image(systemName: availableImage)
                        .foregroundColor(color)
                    
                }.padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.username != "" ? self.color: Color.black.opacity(0.7), lineWidth: 2))
                .padding(.top, 25)
                .padding(.horizontal,25)
                
                
               
                    
              
                
                NavigationLink(destination: FullNameRegisterView(username: $username, email: $email, password: $password), isActive: $goNext) {
                    EmptyView()
                }
                //Next Button
                Button(action: {
                    //TODO
                    viewModel.checkIfUsernameAvailable(username: username) { (available) in
                        if available{
                            self.goNext.toggle()
                            color = Color.green
                            availableImage = "checkmark"
                            self.timer.upstream.connect().cancel()

                        }else{
                            color = Color.red
                            print("Not available")
                            availableImage = "xmark"
                        }
                    }
                }
                ,label: {
                    Text("Next")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                })
                .background(Color.themeAccent)
                .cornerRadius(10)
                .padding(.top,25)
                
                
                
                
            }//end of vstack
            
            
            .navigationBarTitle("Create A Username")
            .foregroundColor(Color.themeForeground)
        }//end of zstack
        
        
        
        
        
    }
}