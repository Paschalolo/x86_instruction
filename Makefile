MFILE=$(FILE).o
ASMFILE=$(FILE).asm
# nasm -f elf64 program.asm -o program.o
COMPILEASM.o = nasm -f elf64 -g 
COMPILEYASM.o = yasm -g dwarf2 -felf64
vpath %.o src 
vpath %.asm src 
r : link 
	./bin/$(FILE) 
run : link 
	./bin/$(FILE)
run2: compilecpp
	./src/$(FILE) && rm src/$(FILE) && rm src/$(MFILE)
compilecpp: compile
	g++-14 src/$(MFILE) src/$(FILE).cpp -o src/$(FILE)

link :  compile 
	ld  src/$(MFILE) -o bin/$(FILE)
compile: $(ASMFILE)
	$(COMPILEASM.o) $< -o src/$(MFILE) 
	
create: 
	touch  src/$(ASMFILE)
clean : 
	rm src/$(FILE) && rm src/$(MFILE)
push : 
	git add . && git commit -m"64  bit bqby "

online : 
	git push origin main 
