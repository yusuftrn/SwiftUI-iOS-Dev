//
// Created by Yusuf Turan on 9.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct ContentView: View {
	
	// Properties
	// ==========
	
	//Colors
	let pinkColor = Color(red: 255, green: 20, blue: 147)
	
	//Game stats
	var sliderValueRounded: Int {
		return Int(self.sliderValue.rounded())
	}
	var sliderTargetDifference: Int {
		return abs(self.sliderValueRounded - self.target)
	}
	@State var alertIsVisible: Bool = false
	@State var sliderValue: Double = 50.0
	@State var target: Int = Int.random(in: 1...100)
	@State var score: Int =  0
	@State var maxScore: Int = 0
	@State var round = 1

	
	//View Modifiers
	struct LabelStyle: ViewModifier {
		func body(content: Content) -> some View {
			content
				.font(Font.custom("Arial Rounded MT Bold", size: 18))
				.foregroundColor(Color.white)
				.modifier(Shadow())
		}
	}
	
	struct ValueStyle: ViewModifier {
		func body(content: Content) -> some View {
			content
				.font(Font.custom("Arial Rounded MT Bold", size: 24))
				.foregroundColor(Color.yellow)
				.modifier(Shadow())
		}
	}
	
	struct Shadow: ViewModifier {
		func body(content: Content) -> some View {
			content
				.shadow(color: Color.black, radius: 5, x: 2, y: 2)
		}
	}
	
	struct ButtonLargeTextStyle: ViewModifier {
		func body(content: Content) -> some View {
			content
				.font(Font.custom("Arial Rounded MT Bold", size: 18))
				.foregroundColor(Color.black)
		}
	}
	
	struct ButtonSmallTextStyle: ViewModifier {
		func body(content: Content) -> some View {
			content
				.font(Font.custom("Arial Rounded MT Bold", size: 12))
				.foregroundColor(Color.black)
		}
	}
	// User interface views
	
    var body: some View {
		NavigationView {
			VStack {
				Spacer().navigationBarTitle("🎯 Bullseye 🎯")
				HStack {
					Text("Put the bullseye as close as you can to:").modifier(LabelStyle())
					Text("\(target)").modifier(ValueStyle())
				}
				
				Spacer()
				
				HStack {
					Text("1").modifier(LabelStyle())
					Slider(value: $sliderValue, in: 1...100)
						.accentColor(Color.pink)
						.animation(.easeOut)
					Text("100").modifier(ValueStyle())
				}
				
				Spacer()
				
				// TODO: Add views for the slider row here.
				
				Button(action: {
					alertIsVisible = true
					
				}) {
					Text("Hit me!").modifier(ButtonLargeTextStyle())
				}
				.background(Image("Button"))
				.modifier(Shadow())
				
				.alert(isPresented: self.$alertIsVisible) {
					Alert(title: Text(alertTitle()),
						  message: Text(scoringMessage()),
						  dismissButton: .default(Text("Awesome!")) {
							//add current score to total score, and get a new target randomly
							self.startNewRound()
						  })
				}
				
				Spacer()
				
				// Score row
				HStack {
					Group {
						Button(action: {
							self.startNewGame()
						}) {
							HStack {
								Image("StartOverIcon")
								Text("Start Over").modifier(ButtonSmallTextStyle())
							}
						}
						.background(Image("Button"))
						.modifier(Shadow())
						Group {
							Spacer()
							Text("High Score:").modifier(LabelStyle())
							Text("\(self.maxScore)").modifier(ValueStyle())
							Spacer()
							Text("Score:").modifier(LabelStyle())
							Text("\(self.score)").modifier(ValueStyle())
							Spacer()
							Text("Round:").modifier(LabelStyle())
							Text("\(self.round )").modifier(ValueStyle())
							Spacer()
						}
						
						NavigationLink(destination: AboutView()) {
							HStack {
								Image("InfoIcon")
								Text("Info").modifier(ButtonSmallTextStyle())
							}
						}
						.background(Image("Button"))
						.modifier(Shadow())
					}
					.padding(.bottom, 20)
					.accentColor(pinkColor)
					}
					
			}
			//start the game with startNewGame() method's properties.
			.onAppear() {
				self.startNewGame()
			}
			.background(Image("Background"))
		}
		.navigationViewStyle(StackNavigationViewStyle())
    }
	
	// Methods
	// =======
	
	
	func startNewGame() {
		self.maxScore = self.calculateMaxScore()
		self.score = 0
		self.round = 1
		self.resetSliderAndTarget()
	}
	
	func startNewRound() {
		self.score += self.pointsForCurrentRound()
		self.round += 1
		self.resetSliderAndTarget()
	}
	
	func resetSliderAndTarget() {
		self.sliderValue = Double.random(in: 1...100)
		self.target = Int.random(in: 1...100)
	}
	
	
	func calculateMaxScore() -> Int {
		return max(score, maxScore)
	}
	
	func pointsForCurrentRound() -> Int {
		let maximumScore = 100
		let points: Int
		if self.sliderTargetDifference == 0 {
			points = 200
		} else if self.sliderTargetDifference == 1 {
			points = 150
		} else {
			points = maximumScore - self.sliderTargetDifference
		}
		return points
	}
	
	func scoringMessage() -> String {
		return "The slider value is \(self.sliderValueRounded).\n" +
				"The target value is \(self.target).\n" +
				"You scored: \(pointsForCurrentRound()) points this round."
	}
	
	func alertTitle() -> String {
		let title: String
		if self.sliderTargetDifference == 0 {
			title = "Perfect!"
		} else if self.sliderTargetDifference < 5 {
			title = "You almost had it!"
		} else if self.sliderTargetDifference <= 10 {
			title = "Not bad."
		} else {
			title = "Are you even trying?"
		}
		return title
	}
}

// Preview
// =======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
