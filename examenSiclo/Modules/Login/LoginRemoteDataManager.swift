//
//  LoginRemoteDataManager.swift
//  examenSiclo
//
//  Created by YEiK on 20/05/22.
//  
//

import Foundation
import Alamofire
import SwiftyJSON

class LoginRemoteDataManager:LoginRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: LoginRemoteDataManagerOutputProtocol?
    
    func externalGetData(userLogin: UserLoginEntity){
        
        let url = "https://api.staging.siclo.plus/auth/login"
        
        let headers = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        let body: [String : Any] = [
            "email": userLogin.email,
            "password": userLogin.password,
        ]
        
        let jsonBody = try? JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions.prettyPrinted)
        let json = NSString(data: jsonBody!, encoding: String.Encoding.utf8.rawValue)
        
        if let json = json {
            print(json)
        }
        
        let urlRequest = URL(string: url)
        var request = URLRequest(url: urlRequest!)
        request.httpMethod = "POST"
        request.httpBody = jsonBody
        request.allHTTPHeaderFields = headers
        
        AF.request(request)
            .validate(statusCode: 200..<600)
            .response { (response) in
                switch response.result {
                case .success:
                    if response.value != nil {
                        if response.response?.statusCode == 200 {
                            self.remoteRequestHandler?.RemoteDataManagerCallBackValidLogin(isValid: true)
                        }else{
                            self.remoteRequestHandler?.RemoteDataManagerCallBackValidLogin(isValid: false)
                            print(JSON(response.value! ?? ""))
                        }
                    }else {
                        self.remoteRequestHandler?.RemoteDataManagerCallBackValidLogin(isValid: false)
                        print(response.response?.statusCode ?? "")
                    }
                    
                case .failure(let error):
                    print(response.error as Any)
                    print(error.localizedDescription)
                }
            }
    }
}
