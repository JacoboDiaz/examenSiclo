//
//  SignUpRemoteDataManager.swift
//  examenSiclo
//
//  Created by YEiK on 20/05/22.
//  
//

import Foundation
import Alamofire
import SwiftyJSON

class SignUpRemoteDataManager:SignUpRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: SignUpRemoteDataManagerOutputProtocol?
    
    func externalGetDataUserSignUp(userSignUp: UserSignUpEntity) {
        
        let url = "https://api.staging.siclo.plus/user"
        
        let headers = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        let body: [String : Any] = [
            "firstname": userSignUp.firstName,
            "lastname": userSignUp.lastName,
            "email": userSignUp.email,//"jacobo_diaz_3@siclotest.com",
            "birthday": userSignUp.birthday,
            "lada": "+52",
            "phone": userSignUp.phone,
            "gender": userSignUp.gender,
            "country": userSignUp.country,
            "weight": userSignUp.weight,
            "height": userSignUp.height,
            "password": userSignUp.password,
            "repeat_password": "12345"
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
                            self.remoteRequestHandler?.remoteDataManagerCallBackValidSignUp(isValid: true)
                        }else{
                            self.remoteRequestHandler?.remoteDataManagerCallBackValidSignUp(isValid: false)
                            print(JSON(response.value! ?? ""))
                        }
                    }else {
                        self.remoteRequestHandler?.remoteDataManagerCallBackValidSignUp(isValid: false)
                        print(response.response?.statusCode ?? "")
                    }
                    
                case .failure(let error):
                    print(response.error as Any)
                    print(error.localizedDescription)
                }
            }
    }
    
    
}
