# Admonition Block Formatter

This is the code that formats admonition blocks for Exercism.
It ensures that blocks always use four tildes.

For example: it converts
````
```exercism/note
something
```
````

to

```
~~~~exercism/note
something
~~~~
```

## Tests

The code requires Ruby, but no other dependencies.

Run the tests by running `rake`.
