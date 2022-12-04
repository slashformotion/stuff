# CONFIGURATION
OUTPUTDIR = "book"
SERVEPORT= 3000

# BUILD OPTS
OPS = --dest-dir=${OUTPUTDIR} 
SERVEOPS = ${OPS} -p ${SERVEPORT}

watch:
	xdg-open localhost:${SERVEPORT}
	mdbook serve ${SERVEOPS}