default: fly

run: fly
	./run_fly.sh
	#./fly -g 900x500

INC = ../include
INC_SECTIONS = ../buildings/cpp-sections

F = -O2 -g -std=c++11 -mcmodel=medium -I$(INC) -I$(INC_SECTIONS)

berlin_objs = ../buildings/cpp-sections/*.o

fly: fly.cpp textures.o draw.h $(INC)/foreach.h $(INC)/pt.h $(berlin_objs)
	g++ $F -o fly fly.cpp textures.o $(berlin_objs) -lGL -lGLU -lSDL2 -lSDL2_image -lm
  
%.o: %.cpp %.h
	g++ $F -c $< 

clean:
	rm -f textures.o fly

# vim: noexpandtab

