## What The hell Optionals "!" "?" are
So as you've seen in the last video we've spoken a little bit about what optionals are and how they

can be used now because this is such a cool concept in swift programming.

We're going to try and drill these ideas home.

Essentially what the hell are optionals.

Instead of looking at code let's imagine instead that we have a box.

So remember our variables are boxes.

And in this ball we're going to put in a cat.

Right.

So Tommy is going inside the box.

Now additionally we're also going to put a bottle of poison into the box which is very easily broken

into and can explode at any time killing or catch Tommy.

Now if we go ahead and wrap up our baulks and we imagine that we can't hear any sound we just leave

the room we'll go on a long haul holiday.

Now the question is when we come back is Tommy the cat alive or dead.

So many of you will recognize that this is essentially the problem of Schrodinger's cat.

So the idea that the cat is simply heinously alive and dead until we open the box or in our case if

the box represents an optional where it can contain nil or it could actually contain a value then only

when we unwrap that box do we find out if it is nil or not.

Now only once we've unwrapped that box can we figure out if there is a value or not.

Now option 1 is that Tommy is alive and well.

The poison was intact and he's happily alive now Option 2 is that the poison exploded killing tomming

the cat and we now have a dead cat in a combo box which is not a great situation to be in.

So creating a variable that has a question mark at the end means that we're creating an optional.

And that means you have this closed box situation where it could contain a value or it could contain

nothing.

Now only when we try to use the variable do we need to open the box and find out if it contains an actual

value or if it contains nil.

So in the cases where our box contains nil then our program will crash.

But in the cases where the box does contain a value then our program will continue to run smoothly.

Now using the exclamation mark after the name of the variable is called Force unwrapping.

And that's basically in our situation with the box is just tearing off the tapes for unwrapping and

dealing with the consequences whatever it may be.

Now the other option that we spoke about which is called optional binding.

In that case what we're saying is that we want to shake the box first and see if it contains anything.

If it seems to contain nothing then we'll just leave the box alone and ignore it instead of crashing

our program.

Now if we shook that box and it did indeed contain something then we will proceed to continue to execute

the rest of our lines of code.

So if we look at the code again in order to declare a new optional the syntax looks identical to when

we create a new variable or new property.

Now the only difference is this questionmark that we tag at the end and what it does.

This question mark is that it changes the data type of this destination variable from a string data

type to a optional string data type.

Now those are two distinct types.

And every other data type for example integers or floats or UI label has an optional counterpart.

Now in order to use a variable of a optional string data type you have to put the exclamation mark at

the end.

And what this effectively does behind the scenes is that it converts that variable from having a data

type of optional string to a data type of string.

And that is called Force unwrapping.

Now as we said forth on robing has its problems because it's basically a manual override over the safety

mechanisms.

And if destination at this point is nil then this line will cause your app or your program to crash.

Now the safe way of doing it is by only implementing the code that could contain a nil value inside

an if statement.

So only when that optional is not nil does it get used in a line of code and preventing any crashes

because of this.

And as we mentioned the swift way of doing this is by using the if.

Let keyword.

So if get a new constant equal the value of our optional that optional has a value then this line of

code gets executed.

Now the thing that you should notice here in this swift code is that there are no more exclamation marks.

We're not force unwrapping anything.

Instead we are playing it safe and we're checking to make sure that the destination variable doesn't

contain a value.

If so then it should be set to a new constant could use a set destination and we will use that new constant

which definitely has a value.

From now on.

And if the value of destination is nil then this check does not pass and none of this code in between

the curly braces gets executed.

So in this module we've spoken about some harder topics in swift programming.

This what a lot of code that we've covered and there's some very abstract concepts like optionals or

inheritance.

Now we're going to be using all of these concepts in the coming tutorials and your understanding will

become more solidified as you begin to use some of these concepts instead of just seeing them in an

abstract way.
