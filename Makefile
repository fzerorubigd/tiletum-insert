SPLIT = $(subst -, ,$@)
COMPONENT = $(word 2, $(SPLIT))
FILE = insert.scad
TARGET = game-insert.zip

all: player_pieces_x4 dice_pool_x1 resource_top_x5 tiles_bottom_x1 tiles_bottom_2_x1 cards_top_x1 actions_top_x1 cathedrals_6_x1 other_tokens_x1 cathedrals_4_x1 circles_x1
	@echo Done!

zip: clean all
	zip $(TARGET) dist/*.stl

player_pieces_x4: box-player_pieces_x4
dice_pool_x1: box-dice_pool_x1
resource_top_x5: box-resource_top_x5 lid-resource_top_x5
tiles_bottom_x1: box-tiles_bottom_x1
tiles_bottom_2_x1: box-tiles_bottom_2_x1
cards_top_x1: box-cards_top_x1 lid-cards_top_x1
actions_top_x1: box-actions_top_x1 lid-actions_top_x1
cathedrals_6_x1: box-cathedrals_6_x1 lid-cathedrals_6_x1
other_tokens_x1: box-other_tokens_x1
cathedrals_4_x1: box-cathedrals_4_x1 lid-cathedrals_4_x1
circles_x1: box-circles_x1

dist: 
	mkdir -p dist

lid-%: dist
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=true" -D "g_b_print_box=false" -D "g_lid_solid=true" -o dist/$(COMPONENT)-lid-solid.stl $(FILE)
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=true" -D "g_b_print_box=false" -D "g_lid_solid=false" -o dist/$(COMPONENT)-lid.stl $(FILE)

box-%: dist
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=false" -D "g_b_print_box=true" -o dist/$(COMPONENT)-box.stl $(FILE)

clean:
	rm -f dist/*.stl $(TARGET)