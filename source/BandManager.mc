using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;

class BandManager {
	// these local vars define "day 1" in the band lists
	var startYear = 2018;
	var startMonth = 5;
	var startDate = 2;
	var utcOffset = 5; // EST
	
	var NUM_DAYS = 3;
	var bandLists = new [NUM_DAYS];
	var startMoment;
	var dayIndex = 0;
	
	function setCurrent() {
	    var now = Time.now();
	    
		// check each day to see if we're in the range of that day	    
	    for(var i=0; i < NUM_DAYS; i++) {
	    	if(now.greaterThan(bandLists[i].startMoment)
	    			&& now.lessThan(bandLists[i].endMoment)) {
	    		dayIndex = i;
	    		bandLists[i].setBandIndex();
	    		return;
	    	}
	    }
	    
	    // if not, just set to 0
	    dayIndex = 0;
	}

	function nextBandString(skip) {
		return bandLists[dayIndex].getBandString(skip);
	}

	function dayString() {
		return bandLists[dayIndex].day;
	}

	function cycleDay() {
		dayIndex += 1;
		if(dayIndex >= NUM_DAYS) {
			dayIndex = 0;
		}
		bandLists[dayIndex].bandIndex = 0;
	}
	
	function nextBand() {
		bandLists[dayIndex].nextBand();
	}
	
	function prevBand() {
		bandLists[dayIndex].prevBand();
	}
	
	function initialize() {
		var options = {
			:year => startYear,
			:month => startMonth,
			:day => startDate,
			:hour => utcOffset };
		startMoment = Gregorian.moment(options);
		
		var oneDay = new Time.Duration(Gregorian.SECONDS_PER_DAY);
		var start = startMoment;

		bandLists[0] = new BandList(start);
		start = start.add(oneDay);
		bandLists[1] = new BandList(start);	
		start = start.add(oneDay);
		bandLists[2] = new BandList(start);
	
		var bandList;

		// populate day1
		bandList = bandLists[0];
		bandList.addBand("He is Legend", 1210, "Black");
		bandList.addBand("The Wild", 1210, "Gold");
		bandList.addBand("Avatar", 1240, "Rebellion");
		bandList.addBand("Red Sun Rising", 1310, "Carolina");
		bandList.addBand("Turnstile", 1340, "Black");
		bandList.addBand("Counterfeit", 1340, "Gold");
		bandList.addBand("Sevendust", 1410, "Rebellion");
		bandList.addBand("Pop Evil", 1450, "Carolina");
		bandList.addBand("Power Trip", 1530, "Black");
		bandList.addBand("Stick to your Guns", 1530, "Gold");
		bandList.addBand("Parkway Drive", 1600, "Rebellion");
		bandList.addBand("Bullet for my Valentine", 1640, "Carolina");
		bandList.addBand("Tremonti", 1725, "Black");
		bandList.addBand("Texas Hippie Coalition", 1725, "Gold");
		bandList.addBand("Stone Temple Pilots", 1755, "Rebellion");
		bandList.addBand("Stone Sour", 1845, "Carolina");
		bandList.addBand("Underoath", 1935, "Black");
		bandList.addBand("Andrew W.K.", 1945, "Gold");
		bandList.addBand("Shinedown", 2025, "Rebellion");
		bandList.addBand("Alice in Chains", 2135, "Carolina");
		
		// populate day2
		bandList = bandLists[1];
		bandList.addBand("Big Story", 1130, "Black");
		bandList.addBand("Palisades", 1130, "Gold");
		bandList.addBand("Palaye Royale", 1220, "Black");
		bandList.addBand("Bad Wolves", 1220, "Gold");
		bandList.addBand("From Ashes to New", 1250, "Carolina");
		bandList.addBand("Shaman's Harvest", 1320, "Rebellion");
		bandList.addBand("Them Evils", 1350, "Black");
		bandList.addBand("Toothgrinder", 1350, "Gold");
		bandList.addBand("Asking Alexandria", 1420, "Carolina");
		bandList.addBand("Trivium", 1500, "Rebellion");
		bandList.addBand("New Year's Day", 1540, "Black");
		bandList.addBand("Joyous Wolf", 1540, "Gold");
		bandList.addBand("Black Veil Brides", 1610, "Carolina");
		bandList.addBand("In this Moment", 1650, "Rebellion");
		bandList.addBand("Butcher Babes", 1730, "Black");
		bandList.addBand("Emmure", 1730, "Gold");
		bandList.addBand("Halestorm", 1800, "Carolina");
		bandList.addBand("Breaking Benjamin", 1850, "Rebellion");
		bandList.addBand("The Used", 1940, "Black");
		bandList.addBand("Hatebreed", 1950, "Gold");
		bandList.addBand("Five Finger Death Punch", 2030, "Carolina");
		bandList.addBand("Godsmack", 2140, "Rebellion");
				
		// populate day3
		bandList = bandLists[2];
		bandList.addBand("Spirit Animal", 1230, "Black");
		bandList.addBand("Cane Hill", 1230, "Gold");
		bandList.addBand("Quicksand", 1300, "Carolina");
		bandList.addBand("The Bronx", 1330, "Rebellion");
		bandList.addBand("Jelly Roll", 1400, "Black");
		bandList.addBand("Mutoid Man", 1400, "Gold");
		bandList.addBand("Thrice", 1430, "Carolina");
		bandList.addBand("Greta Van Fleet", 1505, "Rebellion");
		bandList.addBand("Code Orange", 1540, "Black");
		bandList.addBand("The Blue Stones", 1540, "Gold");
		bandList.addBand("Clutch", 1610, "Carolina");
		bandList.addBand("The Struts", 1645, "Rebellion");
		bandList.addBand("The Sword", 1720, "Black");
		bandList.addBand("The Fever 333", 1720, "Gold");
		bandList.addBand("Billy Idol", 1750, "Carolina");
		bandList.addBand("Incubus", 1850, "Rebellion");
		bandList.addBand("Baroness", 1950, "Black");
		bandList.addBand("Red Fang", 2000, "Gold");
		bandList.addBand("Queens of the Stone Age", 2030, "Carolina");
		bandList.addBand("Muse", 2140, "Rebellion");			
	}
}