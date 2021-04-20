PREFIX = /usr/local

.PHONY: all
all: mnmapget/mnmapget mnmlstget/mnmlstget mnmlstnsrt/mnmlstnsrt

.PHONY: clean
clean:
	rm mnmapget/mnmapget; \
	rm mnmlstget/mnmlstget; \
	rm mnmlstnsrt/mnmlstnsrt

.PHONY: install
install: mnmapget/mnmapget mnmlstget/mnmlstget mnmlstnsrt/mnmlstnsrt
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp mnmapget/mnmapget     $(DESTDIR)$(PREFIX)/bin/mnmapget
	cp mnmlstget/mnmlstget   $(DESTDIR)$(PREFIX)/bin/mnmlstget
	cp mnmlstnsrt/mnmlstnsrt $(DESTDIR)$(PREFIX)/bin/mnmlstnsrt
	cp mnmlgetpth 			 $(DESTDIR)$(PREFIX)/bin/mnmlgetpth

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/mnmapget; \
	rm -f $(DESTDIR)$(PREFIX)/bin/mnmlstget; \
	rm -f $(DESTDIR)$(PREFIX)/bin/mnmlstnsrt; \
	rm -f $(DESTDIR)$(PREFIX)/bin/mnmlgetpth

mnmapget/mnmapget: mnmapget/mnmapget.go
	go build -o mnmapget/mnmapget mnmapget/mnmapget.go

mnmlstget/mnmlstget: mnmlstget/mnmlstget.go
	go build -o mnmlstget/mnmlstget mnmlstget/mnmlstget.go

mnmlstnsrt/mnmlstnsrt: mnmlstnsrt/mnmlstnsrt.go
	go build -o mnmlstnsrt/mnmlstnsrt mnmlstnsrt/mnmlstnsrt.go

