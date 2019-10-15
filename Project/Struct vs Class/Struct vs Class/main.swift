//
//  main.swift
//  Struct vs Class
//
//  Created by Slimn Srarena on 11/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import Foundation

var marvelHero = ClassHero(name: "Iron Man", universe: "Marvel")

var anotherMarvelHero = marvelHero
anotherMarvelHero.name = "The Hulk"

var avengers = [marvelHero, anotherMarvelHero]

avengers[0].name = "Thor"

print("Hero name = \(marvelHero.name)")
print("Another Hero name = \(anotherMarvelHero.name)")
print("first avenger name = \(avengers[0].name)")

var dcHero = StructHero(name: "Wonder Woman", universe: "DC")
var anotherDCHero = dcHero
anotherDCHero.name = "Aquaman"

print("Hero name = \(dcHero.name)")
print("Another Hero name = \(anotherDCHero.name)")

print("Hero revers name = \(dcHero.reversName())")
print("Another Hero revers name = \(anotherDCHero.reversName())")
