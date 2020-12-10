//
//  Comment.swift
//  Continuum
//
//  Created by Jeremy Taylor on 12/8/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation
import CloudKit

struct CommentConstants {
    static let typeKey = "Comment"
    static let textKey = "text"
    static let timestampKey = "timestamp"
    static let postReferenceKey = "post"
}

class Comment {
    let text: String
    let timestamp: Date
    let recordID: CKRecord.ID
    
    var postReference: CKRecord.Reference? {
        guard let post = post else { return nil }
        return CKRecord.Reference(recordID: post.recordID, action: .deleteSelf)
    }
    
    weak var post: Post?
    
    init(text: String, timestamp: Date = Date(), post: Post?, recordID: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString)) {
        self.text = text
        self.timestamp = timestamp
        self.post = post
        self.recordID = recordID
    }
    
} // End of Class

//MARK: - Extensions

extension CKRecord {
    convenience init?(comment: Comment) {
        self.init(recordType: CommentConstants.typeKey, recordID: comment.recordID)
        
        self.setValue(comment.text, forKey: CommentConstants.textKey)
        self.setValue(comment.timestamp, forKey: CommentConstants.timestampKey)
        
        if let reference = comment.postReference {
            self.setValue(reference, forKey: CommentConstants.postReferenceKey)
        }
    }
} // End of CKRecord Extension

extension Comment {
    
    convenience init?(ckrecord: CKRecord, post: Post) {
        guard let text = ckrecord[CommentConstants.textKey] as? String,
              let timestamp = ckrecord[CommentConstants.timestampKey] as? Date else { return nil }
        self.init(text: text, timestamp: timestamp, post: post, recordID: ckrecord.recordID)
              
              
    }
} // End of Comment Extension
