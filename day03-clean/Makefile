
CLM=clean/bin/clm
CPM=clean/bin/cpm

CLMFLAGS = -nw

all: setup learning


learning: learning.icl
	$(CLM) $(CLMFLAGS) -h 4m -s 2m learning -o learning

setup: clean/lib/exe/cocl clean/bin/clm

clean/lib/exe/cocl: clean/bin/clm
	cd clean && make

clean/bin/clm: clean.tar.gz
	tar xzvf clean.tar.gz

clean.tar.gz:
	curl -o clean.tar.gz https://ftp.cs.ru.nl/Clean/Clean31/linux/clean3.1_64.tar.gz

