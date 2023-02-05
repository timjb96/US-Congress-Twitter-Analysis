
//var selector = select("sessionSelect");


// Create map instance
var chart = am4core.create("chartdiv", am4maps.MapChart);

// Set map definition
chart.geodata = am4geodata_region_usa_congressional_usaCongressionalLow;

// Set projection
chart.projection = new am4maps.projections.AlbersUsa();

// Create map polygon series
var polygonSeries = chart.series.push(new am4maps.MapPolygonSeries());

// Make map load polygon (like country names) data from GeoJSON
polygonSeries.useGeodata = true;

// Configure series
var polygonTemplate = polygonSeries.mapPolygons.template;
polygonTemplate.tooltipText = "{STATENAME} {name} , District ID  {id}";

polygonTemplate.fill = am4core.color("#74B266");

// Create hover state and set alternative fill color
var hs = polygonTemplate.states.create("hover");
hs.properties.fill = am4core.color("#367B25");

//import .csv array
const congdata = new Array ("output.js");

//function to change w dropdown
function sessionchange(selector) {
    if ("109th Congress (2005-2007") {
        twitcolor109;
    }
};

//function to highlight twitter if in congress
function twitcolor109(JoinedOn) {
    if (JoinedOn > 2005 && JoinedOn < 2008) {
        return "#FFB6C1"
    }
    return "#74B266";
};

//code sourced from https://www.amcharts.com/docs/v4/tutorials/using-us-congressional-districts-maps/

//read in data 
//apply data to the districts within amcharts- how to relate the two?
//style output
