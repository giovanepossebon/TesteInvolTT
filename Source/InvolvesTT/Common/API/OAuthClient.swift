//
//  OAuthClient.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 23/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import UIKit

import Foundation

internal class OAuthClient: TwitterClientProtocol  {
    
    struct OAuth {
        static let version = "1.0"
        static let signatureMethod = "HMAC-SHA1"
    }
    
    var consumerKey: String
    var consumerSecret: String
    
    var credential: Credential?
    
    let dataEncoding: String.Encoding = .utf8
    
    init(consumerKey: String, consumerSecret: String) {
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
    }
    
    init(consumerKey: String, consumerSecret: String, accessToken: String, accessTokenSecret: String) {
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
        
        let credentialAccessToken = Credential.OAuthAccessToken(key: accessToken, secret: accessTokenSecret)
        self.credential = Credential(accessToken: credentialAccessToken)
    }
    
    func get(_ path: String, baseURL: TwitterURL, parameters: Dictionary<String, Any>, uploadProgress: HTTPRequest.UploadProgressHandler?, downloadProgress: HTTPRequest.DownloadProgressHandler?, success: HTTPRequest.SuccessHandler?, failure: HTTPRequest.FailureHandler?) -> HTTPRequest {
        let url = URL(string: path, relativeTo: baseURL.url)!
        
        let request = HTTPRequest(url: url, method: .GET, parameters: parameters)
        request.headers = ["Authorization": self.authorizationHeader(for: .GET, url: url, parameters: parameters, isMediaUpload: false)]
        request.downloadProgressHandler = downloadProgress
        request.successHandler = success
        request.failureHandler = failure
        request.dataEncoding = self.dataEncoding
        
        request.start()
        return request
    }
    
    func post(_ path: String, baseURL: TwitterURL, parameters: Dictionary<String, Any>, uploadProgress: HTTPRequest.UploadProgressHandler?, downloadProgress: HTTPRequest.DownloadProgressHandler?, success: HTTPRequest.SuccessHandler?, failure: HTTPRequest.FailureHandler?) -> HTTPRequest {
        let url = URL(string: path, relativeTo: baseURL.url)!
        
        var parameters = parameters
        var postData: Data?
        var postDataKey: String?
        
        if let key: Any = parameters[InvolvesAPI.DataParameters.dataKey] {
            if let keyString = key as? String {
                postDataKey = keyString
                postData = parameters[postDataKey!] as? Data
                
                parameters.removeValue(forKey: InvolvesAPI.DataParameters.dataKey)
                parameters.removeValue(forKey: postDataKey!)
            }
        }
        
        var postDataFileName: String?
        if let fileName: Any = parameters[InvolvesAPI.DataParameters.fileNameKey] {
            if let fileNameString = fileName as? String {
                postDataFileName = fileNameString
                parameters.removeValue(forKey: fileNameString)
            }
        }
        
        let request = HTTPRequest(url: url, method: .POST, parameters: parameters)
        request.headers = ["Authorization": self.authorizationHeader(for: .POST, url: url, parameters: parameters, isMediaUpload: postData != nil)]
        request.downloadProgressHandler = downloadProgress
        request.successHandler = success
        request.failureHandler = failure
        request.dataEncoding = self.dataEncoding
        request.encodeParameters = postData == nil
        
        if let postData = postData {
            let fileName = postDataFileName ?? "media.jpg"
            request.add(multipartData: postData, parameterName: postDataKey!, mimeType: "application/octet-stream", fileName: fileName)
        }
        
        request.start()
        return request
    }
    
    func authorizationHeader(for method: HTTPMethodType, url: URL, parameters: Dictionary<String, Any>, isMediaUpload: Bool) -> String {
        var authorizationParameters = Dictionary<String, Any>()
        authorizationParameters["oauth_version"] = OAuth.version
        authorizationParameters["oauth_signature_method"] =  OAuth.signatureMethod
        authorizationParameters["oauth_consumer_key"] = self.consumerKey
        authorizationParameters["oauth_timestamp"] = String(Int(Date().timeIntervalSince1970))
        authorizationParameters["oauth_nonce"] = UUID().uuidString
        
        authorizationParameters["oauth_token"] ??= self.credential?.accessToken?.key
        
        for (key, value) in parameters where key.hasPrefix("oauth_") {
            authorizationParameters.updateValue(value, forKey: key)
        }
        
        let combinedParameters = authorizationParameters +| parameters
        
        let finalParameters = isMediaUpload ? authorizationParameters : combinedParameters
        
        authorizationParameters["oauth_signature"] = self.oauthSignature(for: method, url: url, parameters: finalParameters, accessToken: self.credential?.accessToken)
        
        let authorizationParameterComponents = authorizationParameters.urlEncodedQueryString(using: self.dataEncoding).components(separatedBy: "&").sorted()
        
        var headerComponents = [String]()
        for component in authorizationParameterComponents {
            let subcomponent = component.components(separatedBy: "=")
            if subcomponent.count == 2 {
                headerComponents.append("\(subcomponent[0])=\"\(subcomponent[1])\"")
            }
        }
        
        return "OAuth " + headerComponents.joined(separator: ", ")
    }
    
    func oauthSignature(for method: HTTPMethodType, url: URL, parameters: Dictionary<String, Any>, accessToken token: Credential.OAuthAccessToken?) -> String {
        let tokenSecret = token?.secret.urlEncodedString() ?? ""
        let encodedConsumerSecret = self.consumerSecret.urlEncodedString()
        let signingKey = "\(encodedConsumerSecret)&\(tokenSecret)"
        let parameterComponents = parameters.urlEncodedQueryString(using: dataEncoding).components(separatedBy: "&").sorted()
        let parameterString = parameterComponents.joined(separator: "&")
        let encodedParameterString = parameterString.urlEncodedString()
        let encodedURL = url.absoluteString.urlEncodedString()
        let signatureBaseString = "\(method)&\(encodedURL)&\(encodedParameterString)"
        
        let key = signingKey.data(using: .utf8)!
        let msg = signatureBaseString.data(using: .utf8)!
        let sha1 = HMAC.sha1(key: key, message: msg)!
        return sha1.base64EncodedString(options: [])
    }
    
}
