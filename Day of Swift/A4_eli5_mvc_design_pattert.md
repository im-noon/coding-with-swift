## The Model View Controller(MVC) Design Pattern- Explain Like I'm 5

Hi guys today we are going to tackle a big topic and that is the model you control.

Now in the first module when we talked about the anatomy of an app we spoke about this concept briefly

but as we're building Whistler and we're actually using a full model view controller design pattern

in order to create this app I thought this is a good time to address what exactly is the MVC design

pattern and why is it useful and how are we using it in our app.

So the first thing that we have to address is what exactly is a design pattern.

Well a design pattern is simply a proven solution or a best practice approach to a common problem.

So to give a real life example a common problem that the early man might have faced is how do you stay

warm when it gets dark and cold.

Well very early on people learned that they could build shelters by taking animal hide and make it into

a teepee.

But then later on they realized that actually animal hide is not all that fire retardant.

And also if you have some wild animals lurking around it's not so difficult for them to come in and

eat your family.

So then there was improvement on that design pattern and people brought out mud huts which were made

out of Mont. so that the wind can't easily tear it down and animals find it hard to enter.

But then people improved on that further.

And we have the modern house which is made out of wood so it keeps you warm it keeps you safe.

And the majority of us will agree that this is a pretty good design pattern.

So instead of having every human so instead of having every human who needs to build a shelter go through

the painful process of discovering what is the optimal structure to build as their shelter in the process

possibly losing their family to wild animals.

Instead we've come up with a design pattern or blueprint that tells anyone who's looking to build a

shelter.

What is the best practice for building a house.

So any future house builders can refer to this blueprint and see that oh in order to build a house I

should structure it so that I have a foundation.

I have walls made out of bricks and also I should have a roof on top.

And so this brings us to the model of how you control the design pattern.

So this is something that came out of the research of Trygve Reince skun when he was working on small

talk at Xerox PARC.

Don't worry nobody can pronounce his name.

It's Norwegian and I'm probably messing it up horribly.

But he came up but he came up with the model view controller design patent and this is a really good

design pattern to use when you're building apps using object oriented programming.

And what this design part allows you to do is that if you have an incredibly complex app with many thousands

lines of code then you can structure it using the MVC design pattern instead of spaghetti code which

is basically a single file with loads and loads of code that into link with each other and essentially

just a whole mess to work with.

Instead you can implement a structure that will allow you to manage the complexity of your code.

Let's first talk about the components that make up the.

And the C.

So the M stands for model which is a structure that manages the data.

It's not the data itself but it is responsible for creating new entries into the database or reading

from the database or deleting entries from the database.

So in that way essentially it structures the data and prepares it in a format that The View Controller

can use.

Next is the view and this is actually just what you see on screen and in the middle there is the controller

and it handles communication between the model and the view.

So say if you have a contact app and you're looking for a particular person's phone number so you look

up Amy's phone number and that makes a request to the controller.

The controller then takes this request and does some processing around it to see whether if this is

an appropriate request.

And if it is then it sends a message to the model asking for that data.

Now the model is not the data itself.

Instead the model is like the store room manager.

It graphs the data from the database and formats it in a structure that the controller can understand

and then serves that data back to the controller and the controller prepares it for display on The View.

So the NBC design pattern can be a little bit abstract so to bring the message home I'm going to illustrate

this with an analogy.

So welcome to our restaurant and I'm going to show you how it works in this context.

Now in our restaurant analogy the data will be the raw ingredients.

The model will be the kitchen that prepares and structures the ingredients in two dishes and those dishes

that get passed over to the waiter which is the control in this case and that waiter can take orders

as well as serve orders on to the view which is what the customer sees on the table.

So first we'll start off by making a quest to the controller or the waiter will tell him that we want

to see some pancakes on our table.

Now the waiter is going to take that request to the kitchen the chefs in the kitchen will then go to

the larder and fetch the ingredients that are required to make these pancakes or the data that's required

to be served up.

And then once the data is brought back to the kitchen they will prepare the ingredients and turn it

into something that the waiter can take back to the customer.

And then the diligent waiter will take this dish and present it on the table of the customer.

So if we have a look back in our code in Queensland you can see that the folders organize our code into

The View control the model pattern.

So our controller will be something like View Controller dot swift that controls what gets displayed

on screen as well as what data requests to make.

Now the controller can process those requests.

For example if you enter a password into a text field and it's six characters instead of eight characters

that's required the controller will deal with that and say that no sorry we can't take that input.

And similarly the waiter can say no we can't make a avocado frappuccino with a mint on it.

Then we've got something like question not swift which organizes which prepares the data in a format

that can be easily displayed on screen.

And our question bank in this case is the actual data it contains all of our questions.

And so the question model prepares the question data and hands it back to the view controller and the

view controller then displays that data onto The View or onto the screen so that the user can see those

questions being displayed and can interact with it.

So why do we implement the MVC design pattern.

What are the advantages.

One it provides a structure to your code.

Once your code gets more more complex it can be really hard to get a grip on what exactly is happening

where.

Now by splitting up your code into this model view controller pattern you can find the relevant things

in your code very easily.

Additionally it's a commonly used design pattern and easily recognized by other programmers.

So if you bring a second programmer on board who's also going to work on your code if your code is structured

in an MVC design pattern most programmers will recognize it instantly and be able to work on it without

being confused as to how your code is organized.

Thirdly it allows for code reuse.

So you'll notice that in the MVC design pattern the model and the view never communicate with each other

directly as a customer.

You can't just run into the kitchen and grab what you want and you know and eat that because it would

be chaos.

And the advantage of that is that you can easily change the data without affecting the rest of the code.

So for example if tomorrow I decided the my app was going to be in French I could quite easily change

my data file from the English questions to French questions and I wouldn't need to change how any of

the rest of my code works.

So this allows for code reuse and it is very efficient.

And finally it allows for multitasking.

This is also related to how much you load the code.

So for example if you have three programmers working on the same project you could do things three times

faster by assigning one guy to take care of the view.

So they're going to be the front end designer.

Then you've got one guy who's going to design the backend.

How do you want to manipulate and verify the data etc. and then you've got the mill guy who can work

on The View control them determining when and how you present the data to the view.

So it allows for many people to work on the same project.

So there's a lot of virtues to implementing the MVC design pattern and I know that a lot of beginner

programmers don't like to implement it because it seemed like it's more work but once your code gets

to a certain size without having that structure whether it's using MVC or whether it's using something

else like and the VM it will make your software much easier to maintain.

So that's just a bit on.

So that's just a bit on the MVC design pattern.

If you have any questions about it feel free to leave a comment in the text box below.

Otherwise I'll see you on the next lesson.
