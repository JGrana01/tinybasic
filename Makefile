CC     = gcc
# DBFLAGS = -DDEBUG

all: tinybc
 
tinybc: tokenize.c tinybc.c main.c tokenize.h tinybc.h
	$(CC) $(DBFLAGS) -o $@ tokenize.c tinybc.c main.c -lcurses
 
tinybc.exe: tee.c cat.c tokenize.c tinybc.c main.c tokenize.h tinybc.h
	$(CC) $(DBFLAGS) -DBGR -I. -o $@ tokenize.c tinybc.c main.c -L. -lpdcurses
	$(CC) $(DBFLAGS) -o tee.exe tee.c
	$(CC) $(DBFLAGS) -o cat.exe cat.c

dos: tee.c cat.c tokenize.c tinybc.c main.c tokenize.h tinybc.h
	$(CC) $(DBFLAGS) -DBGR -I\pdcurses -o tinybc.exe tokenize.c tinybc.c main.c c:\pdcurses\dos\pdcurses.a
	$(CC) $(DBFLAGS) -o tee.exe tee.c
	$(CC) $(DBFLAGS) -o cat.exe cat.c

clean:
	rm -f tinybc tinybc.exe
 
.PHONY: clean

install:
	install tinybc /opt/bin
	install tinybc.1.gz /opt/man/man1
	install -d /opt/share/doc/tinybc
	install -m 0644 README /opt/share/doc/tinybc
	install -m 0644 LICENSE /opt/share/doc/tinybc
	install -m 0644 *.bas /opt/share/doc/tinybc
	install -m 0644 tinybctut.txt /opt/share/doc/tinybc

.PHONY: install

remove:
	rm -f /opt/bin/tinybc
	rm -f /opt/share/man/man1/tinybc.1.gz
	rm -rf /opt/share/doc/tinybc

.PHONY: remove

