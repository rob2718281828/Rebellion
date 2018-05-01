class BandList {
	var bands = new [62];
	var count = 0;
	var date = 0000;
	
	function initialize() {
		addBand(504, "He is Legend", 1210, "Black");
		addBand(504, "The Wild", 1210, "Gold");
		addBand(504, "Avatar", 1240, "Rebellion");
		addBand(504, "Red Sun Rising", 1310, "Carolina");
		addBand(504, "Turnstile", 1340, "Black");
		addBand(504, "Counterfeit", 1340, "Gold");
		addBand(504, "Sevendust", 1410, "Rebellion");
		addBand(504, "Pop Evil", 1450, "Carolina");
		addBand(504, "Power Trip", 1530, "Black");
		addBand(504, "Stick to your Guns", 1530, "Gold");
		addBand(504, "Parkway Drive", 1600, "Rebellion");
		addBand(504, "Bullet for my Valentine", 1640, "Carolina");
		addBand(504, "Tremonti", 1725, "Black");
		addBand(504, "Texas Hippie Coalition", 1725, "Gold");
		addBand(504, "Stone Temple Pilots", 1755, "Rebellion");
		addBand(504, "Stone Sour", 1845, "Carolina");
		addBand(504, "Underoath", 1935, "Black");
		addBand(504, "Andrew W.K.", 1945, "Gold");
		addBand(504, "Shinedown", 2025, "Rebellion");
		addBand(504, "Alice in Chains", 2135, "Carolina");
		addBand(505, "Big Story", 1130, "Black");
		addBand(505, "Palisades", 1130, "Gold");
		addBand(505, "Palaye Royale", 1220, "Black");
		addBand(505, "Bad Wolves", 1220, "Gold");
		addBand(505, "From Ashes to New", 1250, "Carolina");
		addBand(505, "Shaman's Harvest", 1320, "Rebellion");
		addBand(505, "Them Evils", 1350, "Black");
		addBand(505, "Toothgrinder", 1350, "Gold");
		addBand(505, "Asking Alexandria", 1420, "Carolina");
		addBand(505, "Trivium", 1500, "Rebellion");
		addBand(505, "New Year's Day", 1540, "Black");
		addBand(505, "Joyous Wolf", 1540, "Gold");
		addBand(505, "Black Veil Brides", 1610, "Carolina");
		addBand(505, "In this Moment", 1650, "Rebellion");
		addBand(505, "Butcher Babes", 1730, "Black");
		addBand(505, "Emmure", 1730, "Gold");
		addBand(505, "Halestorm", 1800, "Carolina");
		addBand(505, "Breaking Benjamin", 1850, "Rebellion");
		addBand(505, "The Used", 1940, "Black");
		addBand(505, "Hatebreed", 1950, "Gold");
		addBand(505, "Five Finger Death Punch", 2030, "Carolina");
		addBand(505, "Godsmack", 2140, "Rebellion");
		addBand(506, "Spirit Animal", 1230, "Black");
		addBand(506, "Cane Hill", 1230, "Gold");
		addBand(506, "Quicksand", 1300, "Carolina");
		addBand(506, "The Bronx", 1330, "Rebellion");
		addBand(506, "Jelly Roll", 1400, "Black");
		addBand(506, "Mutoid Man", 1400, "Gold");
		addBand(506, "Thrice", 1430, "Carolina");
		addBand(506, "Greta Van Fleet", 1505, "Rebellion");
		addBand(506, "Code Orange", 1540, "Black");
		addBand(506, "The Blue Stones", 1540, "Gold");
		addBand(506, "Clutch", 1610, "Carolina");
		addBand(506, "The Struts", 1645, "Rebellion");
		addBand(506, "The Sword", 1720, "Black");
		addBand(506, "The Fever 333", 1720, "Gold");
		addBand(506, "Billy Idol", 1750, "Carolina");
		addBand(506, "Incubus", 1850, "Rebellion");
		addBand(506, "Baroness", 1950, "Black");
		addBand(506, "Red Fang", 2000, "Gold");
		addBand(506, "Queens of the Stone Age", 2030, "Carolina");
		addBand(506, "Muse", 2140, "Rebellion");
	}
	
	function addBand(date, name, time, stage) {
		var band = new Band();
		
		// TODO temp testing date change REMOVE THIS!!
		if(date == 504){
			date = 430;
		} else {
			date -= 4;
		}
		
		band.name = name;
		band.date = date;
		band.time = time;
		band.stage = stage;
		bands[count] = band;
		count++;
	}
	
	// should return the index of the next band
	function getNext(day, now) {
		date = day;
		for(var i=0; i<count; i++) {
			if(bands[i].date >= day && bands[i].time > (now - 5)) {
				return i;
			}
		}
		return 0;
	}
	
	function getBandString(index) {
		if(index > count - 1) {
			return null;
		}
		var b = bands[index];
		
		// crappy way to prevent showing the next day's band 		
		if(b.date != date) {
			return null;
		}
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