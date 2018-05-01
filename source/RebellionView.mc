using Toybox.WatchUi as Ui;
using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;

class RebellionView extends Ui.View {
	var bands;
	var bandIndex = 0;
	var myString;
	
	var time;
	var date;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    	bands = new BandList();
    	
    	// get the current time and date to fetch the next band
    	// note: format_short = all integer values
	    var clockTime = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
	    time = (clockTime.hour * 100) + clockTime.min;
	    date = (clockTime.month * 100) + clockTime.day;
	    
	    // get the next band to play - this is only fetched when the app is started
	    // then the left/right buttons will step through this
    	bandIndex = bands.getNext(date, time);
    }

    // Update the view
    function onUpdate(dc) {
	    var currentTime = System.getClockTime();
		var timeString = Lang.format(
		    "$1$:$2$",
		    [currentTime.hour, currentTime.min.format("%02d")]
		);
		
		// timeLabel shows the current time
		var timeLabel = Ui.View.findDrawableById("TimeLabel");
		timeLabel.setText(timeString);
		
		// dateLabel shows the date we're looking at
		var dateLabel = Ui.View.findDrawableById("DateLabel");
		dateLabel.setText(getDateText());
    
		// add skip to the index to allow manual override
		setBandString("BandLabel1", bandIndex);
		setBandString("BandLabel2", bandIndex + 1);
		
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }
    
    // stupid helper function to turn the date into day of week
    function getDateText() {
    	if(date <= 504) {
    		return "FRI";
    	} else if(date == 505) {
    		return "SAT";
    	} else {
    		return "SUN";
    	}
    }
    
    // Handle null returns from getting band name
    function setBandString(label, index) {
    	var bandString = bands.getBandString(index);
    	var bandLabel = Ui.View.findDrawableById(label);
    	if(bandString != null) {
    		bandLabel.setText(bandString);
    	} else {
    		bandLabel.setText("");
    	}
    }
    
  
    // callback function to select the next band
    function nextBand() {
    	bandIndex += 1;
    	
    	if(bandIndex > bands.count-1) {
    		bandIndex = bands.count-1;
    	}
    }
    
    // callback function to select the prev band
    function prevBand() {
    	bandIndex -= 1;
    	
    	if(bandIndex < 0) {
    		bandIndex = 0;
    	}
    }
    
    // callback function to select the prev band
    function nextDay() {
    	date += 1;
    	if(date > 506) {
    		date = 506;
    	}
    	bandIndex = bands.getNext(date, 0000);
    }
    
    // callback function to select the prev band
    function prevDay() {
    	date -= 1;
    	if(date < 504) {
    		date = 504;
    	}
    	bandIndex = bands.getNext(date, 0000);
    }
    
    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
}
