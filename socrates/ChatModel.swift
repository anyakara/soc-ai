//
//  ChatModel.swift
//  socrates
//
//  Created by Ananya Karra on 7/17/22.

import Foundation

struct Chat: Identifiable {
    var id: UUID {person.id}
    let person: Person
    var messages: [Message]
    var hasUnreadMessage = false
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imgString: String
}

struct Message: Identifiable {
    
//    defining message type here
    enum MessageType  {
        case Sent, Received
    }
    
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String, type:MessageType, date:Date) {
        self.date = date
        self.type = type
        self.text = text
    }
    
    init(_ text: String, type: MessageType) {
        self.init(text, type: type, date: Date())
    }
}

// your thoughts matter!

extension Chat {
    static let sampleChat = [
        Chat(person: Person(name: "Jul 15 Reflections", imgString: "socrates_profile"), messages: [
            Message("How are you feeling?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am not feeling that well actually.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Wanna talk about it?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Sure. I just want to get this off my chest. I feel a little boxed in my environment and I feel so buried in school work. I feel bad that I don't give time to myself to explore other passions.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("What aspects of your problems make you feel that way?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Well, it's the routine. I never get out of it. I need a break to rethink my priorities and make sure that I have time to do other things. I just never thought it was a glaring issue until now. Reflecting back I see that it was just a simple change. I should pay more attention to my needs.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("You're on the right track. Reflecting on what happened is a great way to start. Do you have anything else to say about it?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
        ]),
        
        Chat(person: Person(name: "Jul 13 Reflections", imgString:"socrates_profile"), messages: [
            Message("How are you feeling today?", type: .Received, date: Date(timeIntervalSinceNow: -86400*6)),
            Message("I'm so happy today!", type: .Sent, date: Date(timeIntervalSinceNow: -86400*4)),
            Message("What happened?", type: .Received, date: Date(timeIntervalSinceNow: -86400*4)),
            Message("I scored well on my exams and caught up with friends.", type: .Sent, date: Date(timeIntervalSinceNow: -86400*3)),
            Message("How was your experience catching up with them?", type: .Received, date: Date(timeIntervalSinceNow: -86400*4)),
        ]), ] }
