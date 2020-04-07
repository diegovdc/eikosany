Eikosany {
	*prPutWithinAnOctave {|base, freq|
		^if(((freq >= base) && (freq <= (base*2))),
			{freq},
			{this.prPutWithinAnOctave(base, freq/2)}
		)
	}

	*new{|a,b,c,d,e,f|
		var scale = [a, b, c, d, e, f].powerset
		.select({|col| col.size === 3})
		.collect({|col| col.inject(1, _*_)})
		.inject(List [],
			{|scale, freq_|
				scale.add(this.prPutWithinAnOctave(1, freq_));
			}
		)
		.sort
		.cpsmidi;
		var scaleName = "eikosany_%_%_%_%_%_%".format(a,b,c,d,e,f);
		"Creating scale with name: %".format(scaleName).postln;
		^Scale((0..19), 20, Tuning(scale-scale[0], 2), scaleName);
	}
}