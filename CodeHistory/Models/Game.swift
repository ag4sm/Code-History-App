//
//  Game.swift
//  CodeHistory
//
//  Created by Josh Scoville on 3/31/23.
//

import Foundation

struct Game {
    private(set) var currentQuestionIndex = 0
    private(set) var guesses = [Question: Int]()
    private(set) var isOver = false
    private let questions = Question.allQuestions.shuffled()
    
    var guessCount: (correct: Int, incorrect: Int) {
        var count: (correct: Int, incorrect: Int) = (0,0)
        for (question, guessedIndex) in guesses {
            if question.correctAnswerIndex == guessedIndex {
                count.correct += 1
            } else {
                cound.incorrect += 1
            }
        }
        return count
    }
    
    var numberOfQuestions: Int {
        questions.count
    }
    
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    mutating func makeGuessesForCurrentQuestion(atIndex index: Int) {
        guesses[currentQuestion] = index
    }
    
    mutating func updateGameStatus() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestion += 1
        } else {
            isOver = true
        }
    }
}
