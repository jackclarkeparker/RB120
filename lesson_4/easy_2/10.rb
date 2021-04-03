=begin

What are the benefits of using Object Oriented Programming
in Ruby? Think of as many as you can.

- Using object oriented programming allows us to
  - Interact with objects via their public interfaces, not worrying about
    remembering specific implementations.
  - Call the same public interface methods on a variety of different object types
    and have them all respond in a way specific to themselves.

  - Tuck away logic that deals with a portion of our program into it's own class
    so that we can compartmentalize our program and deal with logic in manageable
    bites.

  - Define common behaviour for a set of distinct specializations inside the context
    of a superclass.
    - Combine common behaviour and specializations using `super`.

  - The world works better when we work at the level of public interfaces.
    - It's like good manners and vibes in polite society, it allows things to
      work better for everyone.
    - Don't have to worry about that objects dodgy back story. We can put all
      it's implementation details and private information inside it's class,
      keep personal things personal. Things flow easier, especially at the
      level of society; everything flows smoothly when we keep things simple.

  - Define new behaviour for our objects when we want to interact with them in
    a new way. Rather than alter existing code to include our new behaviour. It's
    easier to update an object than toil through a sea of method definitions to find
    the right spot that we want to alter.

  - Create class variables to track of information that is useful in th context of
    "objects of this class" at large (how many objects of that type,
    the range of states of those objects, largest object of that type, a string
    paragraph of information about things of the class type...)
  - Create class methods that return these class variables, or give us other information
    that is not specific to an object of the class, but could be useful in the context that
    your class addresses (returns mileage given tank and range arguments in the context of
    vehicles)

  - We can also use access control or in the context of Ruby, Method Access Control to
    limit the availability of various pieces of information outside of the context
    of a class, whilst still having it defined and accessable from within the context
    of a class.
    - Again, it's good to keep some things personal. You still want them to exist.
      I.E. for each person it's important that we have a good relationship with ourselves,
      but it's also important that we are able to regulate what we expose in
      common social spaces and what we withhold. Keep your clothes on, but still be
      able to reproduce.
      - A great invention! Lowers the extent to which we get distracted?
        Keeps us a bit more monogamous? Keeps the cold off our bodies?
        Keeps the UV off our bodies? Protects us from rabid sabretoothed programmers.
        Allows us to represent ourselves in one way or another?
        All of these metaphors can be applied to code.

(
- Namespacing issues are harder to come across
- Build applications faster using prewritten code
- Give functionality to different parts of a program without duplication
- Objects presented as nouns ~ easier to conceptualize (/work with)
- Creating objects allows programmers to think more abstractly about the code
  that they are writing.
- As software becomes more complex this complexity can be more easily managed.
)

=end