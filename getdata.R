require(GISTools)
require(RCurl)
require(rjson)

# Part 1
# map.crime() 
# function to collect police.uk data and convert it to an SPDF
#
# Use:   spdf <- update.police()
#
# Value: a SpatialPointsDataFrame of crimes 
# for 1.5km (1 mile) radius around the location
# 
#  
# The data frame of the returned SPDF has following columns:
#
#   coordinates	- the lat and lon of the crime
#   category   	- one of "Anti-social behaviour","Burglary","Robbery",
#                  "Vehicle crime","Violent crime","Other crime"
#   street      - the approximate address of the crime
#				 	or crime location e.g. "On or near Scrogg Road"
#


# WARNING: the function accesses data from police UK at the 'street' level:
# Note that this means data references points at the centre of nearest street
# to exact crime location and is no more precise than this - 
# do not infer geographical associations when overlaying other data 
# having greater precision.

# First define 2 helper functions that return the Lat Lon and the attributes
# These were designed to match the data that are returned from the police website 
# note that the 'return()' is implicit within these functions  
getLonLat <- function(x) as.numeric(c(x$location$longitude, x$location$latitude))
getAttr <- function(x) c( x$category, x$location$street$name, x$location_type)

map.crime <- function(lat = 53.80366, lng = -1.553957, date = "2015-08") {
	# The function has defaults specifiied for lat, lng and date
	# This uses the getForm function in the Rcurl package to get crime data
	crimes.buf <- getForm( 'http://data.police.uk/api/crimes-street/all-crime', 
		lat=lat,
		lng=lng,
		date=date)
	# The crimes.buf data are converted to an R object using fromJSON	
	crimes <- fromJSON(crimes.buf)
	# The helper functions extract location and attributes
	crimes.loc <- t(sapply(crimes,getLonLat)) 
	crimes.attr <- as.data.frame(t(sapply(crimes,getAttr))) 
	colnames(crimes.attr) <- c("category", "street", "location_type")
	# These are converted to a SPDF
	crimes.pts <- SpatialPointsDataFrame(crimes.loc,crimes.attr) 
	# Specify the projection – in this case just geographical coordinates
	proj4string(crimes.pts) <- CRS("+proj=longlat")
	return(crimes.pts)
}

# Example of use
# crime.pts <- map.crime()
# crime.pts <- map.crime(52.96827, -1.160437, "2016-01")
# plot(crime.pts,pch= 1,col="red")

# Note that ‘head’ doesn’t work on SpatialPointsDataFrames 
# crimes.pts[1:6,]
# Note that types of crimes can be selected for 
# asb.pts <- crimes.pts[crimes.pts$category== "anti-social-behaviour",]
# cda.pts <- crimes.pts[crimes.pts$category== "criminal-damage-arson",]



# Part 2
# geocode - provides geocoding for addresses via Google
#
# Use: Value <- geocode("NG7 6LH")
#
# addresses:  a character vector - each element is an address
#
#
# Value: a 4-column data frame
#    acc:  Description of accuracy.
#   addr:  Address supplied
#    lat:  Latitude if Google got a single match
#    lng:  Longitude if Google got a single match
#
# Limitation - only 2,500 look-ups per ip address per day

# Geocoding example,  using the Google api

# The following function works for a SINGLE address
# This is really just a 'helper' function
geocode.i <- function(addr) {
	# gets the raw data from the Google API
	urlData <- getForm("http://maps.googleapis.com/maps/api/geocode/json",
	           address=addr, sensor="false",binary=F)
	# The urlData data are converted to an R object using fromJSON	
	urlData <- fromJSON(urlData)
	# defaul latitude, longitude and accuracy values 
	# in case the address cannt be located by Google
	lat <- -999
	lng <- -999
	acc <- "UNRESOLVED"
	# Check to see that the return from Google is valid
    if (urlData$status == "OK") {
    	geoResults <- urlData$results
    	# check to see that the geoResults has a value
    	if (length(geoResults) == 1) {
    		geoResults <- geoResults[[1]]
    		lat <- geoResults$geometry$location$lat
    		lng <- geoResults$geometry$location$lng
    		acc <- geoResults$geometry$location_type }}
    # returns the values to a data frame
    return(data.frame(acc=acc,addr=addr,lat=lat,lng=lng))}
    		
# The wrapper function that takes a list of addresses 
geocode <- function(addr.list) {
	# creates an empty result variable
	result <- NULL
	# loops through each of the addresses in sequence 
	for (addr in addr.list) {
		# adds the result to the result variable
		result <- rbind(result,geocode.i(addr))}
    return(result) }

# Example of use
# geocode("Worsley Building, Leeds")
# add.list <- c("ls2 9JT", "Worsley Building, Leeds", "Leeds United, Elland Rd, Leeds") 
# geocode(add.list)				
# add.list <- c("ls2 9JT", "Worsley Building, Leeds", "Nafees Restaurant, 69A Raglan Rd, Leeds", "Akmal's Tandoori, 235 Woodhouse Ln, Leeds, Leeds") 
# geocode(add.list)				









	    
	   
