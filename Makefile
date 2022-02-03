install:
	mkdir -p ~/bin/
	cp ./bin/* ~/bin/.

image:
	puavo-image-patch ./config 
