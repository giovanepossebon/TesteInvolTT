//
//  TwitterClientProtocol.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 23/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import Foundation

protocol TwitterClientProtocol {
    
    var credential: Credential? { get set }
    
    @discardableResult
    func get(_ path: String, baseURL: TwitterURL, parameters: Dictionary<String, Any>, uploadProgress: HTTPRequest.UploadProgressHandler?, downloadProgress: HTTPRequest.DownloadProgressHandler?, success: HTTPRequest.SuccessHandler?, failure: HTTPRequest.FailureHandler?) -> HTTPRequest
    
    @discardableResult
    func post(_ path: String, baseURL: TwitterURL, parameters: Dictionary<String, Any>, uploadProgress: HTTPRequest.UploadProgressHandler?, downloadProgress: HTTPRequest.DownloadProgressHandler?, success: HTTPRequest.SuccessHandler?, failure: HTTPRequest.FailureHandler?) -> HTTPRequest
    
}
