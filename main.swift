//
//  main.swift
//  Hangman
//
//  Created by Michael Mayer on 9/2/16.
//  Copyright © 2016 Michael M. Mayer. All rights reserved.
//

import Foundation

var words = [String]()
func loadDictionary() {
	do {
		words = try String(contentsOfFile: "/usr/share/dict/words").componentsSeparatedByString("\n").filter() { word in
			return word.characters.count > 4 && word.characters.count < 9 }

	}
	catch {
		words = ["RHYTHM"]
	}
}

let hangman = ["__\n  |", "__\n  |\n  O", "__\n  |\n  O\n  I", "__\n  |\n  O\n  I\n /",
               "__\n  |\n  O\n  I\n / \\", "__\n  |\n \\O\n  I\n / \\",
               "__\n  |\n \\O/\n  I\n / \\", "__\n  |\n \\O/\n  I\n_/ \\",
               "__\n  |\n \\O/\n  I\n_/ \\_"]

loadDictionary()
let max = words.count
let word = words[Int(arc4random_uniform(UInt32(max)))].uppercaseString
var usedLetters = [Character]()
var lettersFound = 0
print("Welcome to Hangman!")
print("Press a letter to guess, or Ctrl+D to quit.")

func printWord() {
	print("\nWord: ", terminator: "")
	var missingLetters = false
	
	for letter in word.characters {
		if usedLetters.contains(letter) {
			print(letter, terminator: "")
		} else {
			print("_", terminator: "")
			missingLetters = true
		}
	}
	
	print("\nGuesses: \(usedLetters.count - lettersFound)/8 \(usedLetters)")
	print(hangman[usedLetters.count - lettersFound])
	
	if missingLetters == false {
		print("It looks like you live on… for now.")
		exit(0)
	} else {
		if usedLetters.count - lettersFound == 8 {
			print("Oops – you died! The word was \(word).")
			print("Thanks for playing!")
			exit(0)
		} else {
			print("Enter a guess: ", terminator: "")
		}
	}
}

printWord()
while var input = readLine() {
	if let letter = input.uppercaseString.characters.first {
		if usedLetters.contains(letter) {
			print("You used that letter already!")
		} else {
			if word.characters.contains(letter) {
				lettersFound += 1
			}
			usedLetters.append(letter)
		}
	}
	printWord()
}
