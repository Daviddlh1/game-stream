//
//  ContentView.swift
//  GameStream
//
//  Created by David De la Hoz on 31/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Spacer()
            Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 1.0).ignoresSafeArea()
            VStack {
                Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 60)
                logInAndSignUp()
            }
        }
    }
}

struct logInAndSignUp:View {
    @State var isLogin = true
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("LOGIN", action: { isLogin = true })
                    .foregroundStyle(isLogin ? .white : .gray)
                Spacer()
                Button("SIGN UP", action: { isLogin = false })
                    .foregroundStyle(!isLogin ? .white : .gray)
                Spacer()
            }
        }
        
        Spacer(minLength: 42)
        
        if isLogin {
            LoginView()
        } else  {
            SignUpView()
        }
    }
}

struct LoginView: View {
    @State var emailTextField = ""
    @State var passwordTextField = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Email").foregroundStyle(Color("dark-cian"))
                ZStack(alignment: .leading) {
                    if emailTextField.isEmpty {
                        Text("ejemplo@gmail.com")
                            .foregroundStyle(.gray)
                            .font(.caption)
                    }
                    TextField("", text: $emailTextField)
                }
                Divider().frame(height: 1).background(Color("dark-cian"))
                    .padding(.bottom)
                
                
                Text("Password")
                    .foregroundStyle(Color("light-gray"))
                ZStack(alignment: .leading) {
                    if emailTextField.isEmpty {
                        Text("password")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    SecureField("", text: $passwordTextField)
                }
                Divider().frame(height: 1).background(Color("dark-cian"))
                    .padding(.bottom)
            }.padding(.horizontal, 77)
        }
    }
}

struct SignUpView: View {
    var body: some View {
        Text("Sign Up View").foregroundStyle(.white)
    }
}


#Preview {
    ContentView()
}

//struct ContentView_Preview: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//    
//    
//}
