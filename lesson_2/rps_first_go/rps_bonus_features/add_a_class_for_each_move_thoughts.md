I went ahead and added a class for each move, I went for this initially because Rubocop was complaining about really lengthy `>` and `<` Move instance methods, and I figured I could push the 5 conditions for winning into each respective class, and giving each method the same name such that we could call an equivalently named instance method on each, and they would respond with the corresponding implementation.

I ended up giving Move another attribute ~ `@choice` which references a collaborator object - one of the Rock, Paper, Scissors, Spock, Lizard classes depending on the input for initialization of a given players `Move` collaborator object.

The utility of using `Move` as a superclass for the `Rock`, `Paper`, `Scissors`, `Spock`, and `Lizard` subclasses is that each can inherit the predicate methods for checking what type they are.

I feel that using the instance variable `@value` for both `Move` and each of it's subclasses is pretty confusing, particularly given that they almost have like overlapping designation semantically. I use the Move `value` attribute to pass the name of. I've dealt with this by changing the `to_s` implementation in `Move` to return the `value` attribute of `self`'s `choice` collaborator object. :)

It felt a little clunky and I got really confused for a while there about why my `scissors?`, `rock?`, `paper?`, `spock?`, and `lizard?` instance methods were no longer working.
- In the end, I realised that the issue was that these methods were being called on objects of a subclass which didn't have a `@value` attribute.
- I tried to assign them a default `@value` attribute, but this didn't work consistently. Which led me to altering my predicate methods to directly ask whether the object was of a given type using the `instance_of?` method. However, I have since reimplemented this solution, and now consider that the problem may have been that my predicate methods were assigning objects to my variables rather than comparing them (using `=` for comparison rather than `==`)
