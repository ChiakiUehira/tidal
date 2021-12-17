(
SynthDef(\superbass, {|out, speed=1, decay=0, sustain=0.1, pan, accelerate, freq,
	gate=1, cutoff= 800, rq=0.2|
	var sound;
	var env = EnvGen.ar(Env.adsr(0.01,0.0,0.9,0.05),gate,doneAction:2, timeScale:sustain);
	var osc, filter, filterenv;
	freq = freq / 4.0;
	osc = Saw.ar(freq);
	filterenv = EnvGen.ar(Env.adsr(0.0,0.5,0.2,0.2),gate,doneAction:2);
	filter =  RLPF.ar(osc,cutoff*filterenv+100,rq);
	sound = Mix(filter);
	OffsetOut.ar(out, DirtPan.ar(sound, ~dirt.numChannels, pan, env));
}).add
);
