PREFIX = /usr/local

.PHONY: all
all: mnmapget/mnmapget mnmlstget/mnmlstget mnmlstnsrt/mnmlstnsrt mnmlid/mnmlid

.PHONY: clean
clean:
	rm mnmapget/mnmapget; \
	rm mnmlstget/mnmlstget; \
	rm mnmlstnsrt/mnmlstnsrt; \
	rm mnmlid/mnmlid

.PHONY: install
install: mnmapget/mnmapget mnmlstget/mnmlstget mnmlstnsrt/mnmlstnsrt mnmlid/mnmlid
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp mnmapget/mnmapget     $(DESTDIR)$(PREFIX)/bin/mnmapget
	cp mnmlstget/mnmlstget   $(DESTDIR)$(PREFIX)/bin/mnmlstget
	cp mnmlstnsrt/mnmlstnsrt $(DESTDIR)$(PREFIX)/bin/mnmlstnsrt
	cp mnmlid/mnmlid 			 	 $(DESTDIR)$(PREFIX)/bin/mnmlid
	cp mnmlgetpth 			 		 $(DESTDIR)$(PREFIX)/bin/mnmlgetpth
	cp mnmapkeys 			 		   $(DESTDIR)$(PREFIX)/bin/mnmapkeys

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/mnmapget; \
	rm -f $(DESTDIR)$(PREFIX)/bin/mnmlstget; \
	rm -f $(DESTDIR)$(PREFIX)/bin/mnmlstnsrt; \
	rm -f $(DESTDIR)$(PREFIX)/bin/mnmlid; \
	rm -f $(DESTDIR)$(PREFIX)/bin/mnmapkeys; \
	rm -f $(DESTDIR)$(PREFIX)/bin/mnmlgetpth

mnmapget/mnmapget: mnmapget/mnmapget.go
	go build -o mnmapget/mnmapget mnmapget/mnmapget.go

mnmlstget/mnmlstget: mnmlstget/mnmlstget.go
	go build -o mnmlstget/mnmlstget mnmlstget/mnmlstget.go

mnmlstnsrt/mnmlstnsrt: mnmlstnsrt/mnmlstnsrt.go
	go build -o mnmlstnsrt/mnmlstnsrt mnmlstnsrt/mnmlstnsrt.go

mnmlid/mnmlid: mnmlid/mnmlid.c
	$(CC) -std=c89 -D_POSIX_C_SOURCE=199309L -o mnmlid/mnmlid mnmlid/mnmlid.c

.PHONY: nix-build
nix-build:
	nix-build -E "with import <nixpkgs> {}; callPackage ./default.nix {}"
