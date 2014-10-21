
FILES = index.html logo.html binaries.html help.html \
	releases.html advisories.html sources.html projects.html \
	info.html compile.html
XSL = xml/basic.xsl xml/footer.xsl xml/h5l.xsl xml/header.xsl \
	xml/releases.xsl xml/advisories.xsl xml/projects.xml xml/info.xml \
	compile.xml

all: build install

build: $(FILES:.html=.htmln) $(XSL)

install: $(FILES:.html:.htmln)
	for a in $(FILES); do mv $${a}n $$a ; done

clean:
	rm -f *.htmln $(FILES)

.xml.htmln:
	xsltproc --xinclude -o $@ xml/h5l.xsl $<

VPATH = xml

SUFFIXES = .xml .htmln .html
.SUFFIXES: .xml .htmln .html

