using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;

class BandList {
	var bands = new [22];
	var count = 0;
	
	var startMoment;
	var endMoment;
	var day;
	
	var bandIndex = 0;
	
	function initialize(start) {
		startMoment = start;
		
		var oneDay = new Time.Duration(Gregorian.SECONDS_PER_DAY);
		endMoment = start.add(oneDay);

		var clockTime = Gregorian.info(startMoment, Time.FORMAT_MEDIUM);
		day = clockTime.day_of_week;
	}
	
	// set the index for the next band based on the current time
	// call this function only if the current bandlist is "today", otherwise let it remain default = 0
	function setBandIndex() {
	    var clockTime = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
	    var now = (clockTime.hour * 100) + clockTime.min;
		
		for(var i=0; i<count; i++) {
			if(bands[i].time > (now - 5)) {
				bandIndex = i;
				return;
			}
		}
		
		// must be the end of the day...
		bandIndex = count-1;
	}
	
	function nextBand() {
		bandIndex += 1;
		if(bandIndex >= count) {
			bandIndex = count-1;
		}
	}
	
	function prevBand() {
		bandIndex -= 1;
		if(bandIndex < 0) {
			bandIndex = 0;
		}
	}
	
	// add a band to the array
	function addBand(name, time, stage) {
		var band = new Band();
		band.name = name;
		band.time = time;
		band.stage = stage;
		bands[count] = band;
		count++;
	}
	
	// get the formatted string for the next band
	// if skip value = 1, it's the band after the next band, etc
	function getBandString(skip) {
		if(bandIndex + skip > count - 1 || bandIndex + skip < 0) {
			return null;
		}
		var b = bands[bandIndex + skip];
		return b.toString();
	}
}

class Band {
	var name = "";
	var time = 0000;
	var date = 0000;
	var stage = "";
	
	function toString() {
		var str = "";
		
		var hour = time / 100;
		var minute = time - (hour * 100);

		var timeString = Lang.format(
		    "$1$:$2$",
		   [hour, minute.format("%02d")]
		);
		str = timeString + " - " + stage + "\n" + name;
		return str;
	}
}