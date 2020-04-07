# Eikosany

A generator for "eikosanic" scales: 20 tone justly intoned scales made up of all the products of 3 elements of a 6 note set.

## Usage
```supercollider
~myEikosany = Eikosany(1,3,5,7,11,13)


(
Pbind(
    \degree, Pseq((0..19).scramble, inf), // your melody goes here
    \scale, e, // your scale goes here
    \root, -3 // semitones relative to 60.midicps, so this is A
).play;
)

```


## Concept
The concept for this scales was developed by Erv Wilson. [http://www.anaphoria.com/wilson.html]

![alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Eikosany1.jpg/800px-Eikosany1.jpg "Erv Wilson's Eikosany")

This is still a work in progress.
