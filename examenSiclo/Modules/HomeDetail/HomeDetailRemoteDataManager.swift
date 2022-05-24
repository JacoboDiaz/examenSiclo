//
//  HomeDetailRemoteDataManager.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 22/05/22.
//  
//

import Foundation
import Alamofire
import SwiftyJSON

class HomeDetailRemoteDataManager:HomeDetailRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeDetailRemoteDataManagerOutputProtocol?
    
    func remoteGetData() {
        let url = "https://api.siclo.com/api/v2/plus/calendar/?location=603967&page_size=-1"
        
        let headers = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        let urlRequest = URL(string: url)
        var request = URLRequest(url: urlRequest!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        AF.request(request)
            .validate(statusCode: 200..<600)
            .response { (response) in
                switch response.result {
                case .success:
                    if response.value != nil {
                        if response.response?.statusCode == 200 {
                            print(JSON(response.value! ?? ""))
                            let json = JSON(response.value! ?? "")
                            self.remoteRequestHandler?.homeDetailRemoteDataManagerCallBackData(classScheduleJSON: json, status: true)
                        }else{
//                            self.remoteRequestHandler?.homeDetailRemoteDataManagerCallBackData(classScheduleJSON: JSON(), status: false)
                            print(JSON(response.value! ?? ""))
                        }
                    }else {
//                        self.remoteRequestHandler?.homeDetailRemoteDataManagerCallBackData(classScheduleJSON: JSON(), status: false)
                        print(response.response?.statusCode ?? "")
                    }
                    
                case .failure(let error):
                    print(response.error as Any)
                    print(error.localizedDescription)
//                    self.remoteRequestHandler?.homeDetailRemoteDataManagerCallBackData(classScheduleJSON: JSON(), status: false)
                }
            }
        
    }
    
}
