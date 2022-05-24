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
//        request.httpBody = jsonBody
        request.allHTTPHeaderFields = headers
        var classSchedule : [ClassSchedule] = [ClassSchedule]()
        AF.request(request)
            .validate(statusCode: 200..<600)
            .response { (response) in
                switch response.result {
                case .success:
                    if response.value != nil {
                        if response.response?.statusCode == 200 {
                            print(JSON(response.value! ?? ""))
                            
                            guard let data = response.data else {return}
                            do {
                                let decoder = JSONDecoder()
                                
                                classSchedule.append(try decoder.decode(ClassSchedule.self, from: data))
//                                let classSchedule = try decoder.decode(ClassSchedule.self, from: data)
                                print(classSchedule)
                                self.remoteRequestHandler?.homeDetailRemoteDataManagerCallBackData(classSchedule: classSchedule, status: true)
                            } catch {
                                print(error)
                                self.remoteRequestHandler?.homeDetailRemoteDataManagerCallBackData(classSchedule: classSchedule, status: true)
                            }

                        }else{
//                            self.remoteRequestHandler?.homeDetailRemoteDataManagerCallBackData(classSchedule: classSchedule, status: false)
                            print(JSON(response.value! ?? ""))
                        }
                    }else {
//                        self.remoteRequestHandler?.homeDetailRemoteDataManagerCallBackData(classSchedule: classSchedule, status: false)
                        print(response.response?.statusCode ?? "")
                    }
                    
                case .failure(let error):
                    print(response.error as Any)
                    print(error.localizedDescription)
//                    self.remoteRequestHandler?.homeDetailRemoteDataManagerCallBackData(classSchedule: classSchedule, status: false)
                }
            }
        
    }
    
}
