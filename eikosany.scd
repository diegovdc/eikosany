(
var putWithinAnOctave = {|base, freq|

	if(((freq >= base) && (freq <= (base*2))),
		{freq},
		{putWithinAnOctave.(base, freq/2)}
	)
};


var eikosany = {|freq, a,b,c,d,e,f|
	[a, b, c, d, e, f].powerset
	.select({|col| col.size === 3})
	.collect({|col| col.inject(1, _*_)})
	.collect(_*freq)
	.inject(List [],
		{|scale, freq_|
			scale.add(putWithinAnOctave.(freq, freq_));
		}
	)
	.sort.postln
	.ratiomidi - 71.804474311912
};
a = Scale((0..19), 20, Tuning(eikosany.(60, 3,5,7,9,11, 13), 2), "eikosany");
)

Scale(\eikosany)

{SinOsc.ar(a.degreeToFreq(3, 63.28125, 3), mul: 0.2)}.play

{SinOsc.ar(a.degreeToFreq(17, 63.28125, 4), mul: 0.2)}.play

{SinOsc.ar(a.degreeToFreq(11, 63.28125, 4), mul: 0.2)}.play

{SinOsc.ar(a.degreeToFreq(14, 63.28125, 2), mul: 0.2)}.play

(
Pbind(
    \degree, Pseq((0..19), inf), // your melody goes here
    \scale, a, // your scale goes here
    \root, -3 // semitones relative to 60.midicps, so this is A
).play;
)