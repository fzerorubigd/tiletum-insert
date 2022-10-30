include <bit/boardgame_insert_toolkit_lib.2.scad>;

// determines whether lids are output.
g_b_print_lid = true;

// determines whether boxes are output.
g_b_print_box = true; 

// Focus on one box
g_isolated_print_box = "optional_spacer"; 

// Used to visualize how all of the boxes fit together. 
g_b_visualization = f;          
        
// this is the outer wall thickness. 
//Default = 1.5mm
g_wall_thickness = 1.5;

// The tolerance value is extra space put between planes of the lid and box that fit together.
// Increase the tolerance to loosen the fit and decrease it to tighten it.
//
// Note that the tolerance is applied exclusively to the lid.
// So if the lid is too tight or too loose, change this value ( up for looser fit, down for tighter fit ) and 
// you only need to reprint the lid.
// 
// The exception is the stackable box, where the bottom of the box is the lid of the box below,
// in which case the tolerance also affects that box bottom.
//
g_tolerance = 0.15;

// This adjusts the position of the lid detents downward. 
// The larger the value, the bigger the gap between the lid and the box.
g_tolerance_detents_pos = 0.1;

g_lid_solid = true;

lid_attr = [[ LID_SOLID_B, g_lid_solid]];

gw = g_wall_thickness;
gw2 = g_wall_thickness * 2;
g_cut = 3.5;
//tiletum

box_width = 285;
box_height = 285;
box_depth = 50;

// Player

p_width = box_width/5;
p_depth = 35;
p_height = 100;

pillars_3 = p_width-gw2;
pillars_2 = 35;
pillars_1 = 20;

pillars_depth = 7;
pillars_r = 17;
// Resources
pl_depth = box_depth-p_depth;
pl_big = 35+gw2;
pl_small = p_height - pl_big;

// tiles 

tiles_big_height = 140;
tiles_small_height = 70;
tiles_depth = 33;
corruption_width = 31;
action_height = tiles_big_height-tiles_small_height-corruption_width-gw2;

/////

tile_width = 25.7+gw2;
tiles_width = 76+gw2;
tiles_height = 3*(tile_width+gw)+gw;
tile_depth = tile_width+gw2+gw;

top_tile_depth = box_depth - tile_depth;

// cathedrals

remaining_height = box_width-tiles_width-gw;

cat_width = (remaining_height - 7*gw)/5;
cat_bounus_width = 19;
cat_height = cat_bounus_width * 2+gw;

cat_6_width = (cat_width+gw)*3+gw;
cat_4_width = (cat_width+gw)*2+gw;

cat_46_height = (cat_height+gw)*2+gw;
cat_46_depth = box_depth/2-gw2;

cat_under_depth = box_depth-cat_46_depth;

action_wheel_r = 80;

spacer_width = box_width - p_height - cat_width;
spacer_height = box_width - tiles_width;
spacer_depth = box_depth / 3;

echo ("Printing: ",g_isolated_print_box);
data =
[
    [   "player_pieces_x4",
        [
            [ BOX_SIZE_XYZ, [p_height, p_width, p_depth] ],
            [ BOX_STACKABLE_B, true],
            [ BOX_NO_LID_B, true],   
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ pillars_2, pillars_3, p_depth-gw-pillars_depth] ],
                    [POSITION_XY,               [0,0,CENTER]],
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ pillars_2+pillars_1-gw2/3-gw, pillars_1-gw2, p_depth-gw-pillars_depth] ],
                    [POSITION_XY,               [0,0,CENTER]],
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ pillars_r, pillars_r, p_depth-gw] ],
                    [POSITION_XY,               [0,0,CENTER]],
                    [CMP_SHAPE, ROUND],
                    [CMP_SHAPE_VERTICAL_B, t]
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ pillars_r, pillars_r, p_depth-gw] ],
                    [POSITION_XY,               [0,pillars_r+gw,CENTER]],
                    [CMP_SHAPE, ROUND],
                    [CMP_SHAPE_VERTICAL_B, t]
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ pillars_r, pillars_r, p_depth-gw] ],
                    [POSITION_XY,               [0,2*pillars_r+gw2,CENTER]],
                    [CMP_SHAPE, ROUND],
                    [CMP_SHAPE_VERTICAL_B, t]
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ pillars_r, pillars_r, p_depth-gw] ],
                    [POSITION_XY,               [pillars_r+gw/2,2*pillars_r+gw2,CENTER]],
                    [CMP_SHAPE, ROUND],
                    [CMP_SHAPE_VERTICAL_B, t]
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ pillars_r, pillars_r, p_depth-gw] ],
                    [POSITION_XY,               [pillars_r+gw/2,pillars_r+gw,CENTER]],
                    [CMP_SHAPE, ROUND],
                    [CMP_SHAPE_VERTICAL_B, t]
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ pillars_r, pillars_r, p_depth-gw] ],
                    [POSITION_XY,               [pillars_r+gw/2,0,CENTER]],
                    [CMP_SHAPE, ROUND],
                    [CMP_SHAPE_VERTICAL_B, t]
                ]
            ], 
             [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ pillars_r, pillars_r, p_depth-gw] ],
                    [POSITION_XY,               [2*pillars_r+gw,0,CENTER]],
                    [CMP_SHAPE, ROUND],
                    [CMP_SHAPE_VERTICAL_B, t]
                ]
            ],             
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ p_height-pillars_1-pillars_2-gw, p_width-gw2, p_depth-gw] ],
                    [POSITION_XY,               [pillars_2+pillars_1-gw,0,CENTER]],
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ pillars_2-gw2, pillars_3-pillars_1+gw, p_depth-gw] ],
                    [POSITION_XY,               [pillars_2+gw,pillars_1-gw,CENTER]],
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ pillars_1+gw2+gw2, p_width-gw2, g_cut] ],
                    [POSITION_XY,               [pillars_2,CENTER,CENTER]],
                ]
            ]
        ]
    ],
    [   "dice_pool_x1",
        [
            [ BOX_SIZE_XYZ, [p_height, p_width, p_depth] ],
            [ BOX_STACKABLE_B, true],
            [ BOX_NO_LID_B, true],   
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ p_height-gw2, p_width-gw2, p_depth-gw] ],  
                ]
            ]
        ]
    ],
    [ "resource_top_x5",
        [ 
            [BOX_SIZE_XYZ, [p_height, p_width, pl_depth]],
            [ BOX_LID,
                lid_attr,
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ pl_big-gw2, p_width-gw2, pl_depth-gw] ],
                    [POSITION_XY,               [0,0,CENTER]],
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ pl_small-gw, p_width-gw2, pl_depth-gw] ],
                    [POSITION_XY,               [pl_big-gw,0,CENTER]],
                ]
            ]
        ]
    ],
    [ "tiles_bottom_x1",
        [ 
            [BOX_SIZE_XYZ, [tiles_height, tiles_width, tile_depth]],
            [ BOX_STACKABLE_B, true],
            [ BOX_NO_LID_B, true],  
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ tile_width, tiles_width-gw2, tile_depth-gw2-gw] ],
                    [CMP_PEDESTAL_BASE_B, true],
                    [POSITION_XY,               [0,0,CENTER]],
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ tile_width, tiles_width-gw2, tile_depth-gw] ],
                    [POSITION_XY,               [tile_width+gw,0,CENTER]],
                    [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
                ]
            ],            
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ tile_width, tiles_width-gw2, tile_depth-gw] ],
                    [POSITION_XY,               [2*(tile_width+gw),0,CENTER]],
                    [ CMP_CUTOUT_SIDES_4B, [ f, t, f, f ] ],
                ]
            ],  
        ]
    ],
    [ "tiles_bottom_2_x1",
        [ 
            [BOX_SIZE_XYZ, [tiles_height, tiles_width, tile_depth]],
            [ BOX_STACKABLE_B, true],
            [ BOX_NO_LID_B, true],  
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ tile_width, tiles_width-gw2, tile_depth-gw] ],
                    [ CMP_CUTOUT_SIDES_4B, [ f, t, f, f ] ],
                    [POSITION_XY,               [0,0,CENTER]],
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ tile_width, tiles_width-gw2, tile_depth-gw] ],
                    [POSITION_XY,               [tile_width+gw,0,CENTER]],
                    [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
                ]
            ],            
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ tile_width, tiles_width-gw2, tile_depth-gw] ],
                    [POSITION_XY,               [2*(tile_width+gw),0,CENTER]],
                    [ CMP_CUTOUT_SIDES_4B, [ f, t, f, f ] ],
                ]
            ],  
        ]
    ],
    [ "cards_top_x1",
        [ 
            [BOX_SIZE_XYZ, [tiles_height, tiles_width, top_tile_depth]],
            [ BOX_LID,
                lid_attr,
            ], 
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ tiles_height-gw2, tiles_width-gw2, top_tile_depth-gw2-gw] ],
                    [ CMP_CUTOUT_SIDES_4B, [ f, f, f, f ] ],
                ]
            ], 
        ]
    ],
    [ "actions_top_x1",
        [ 
            [BOX_SIZE_XYZ, [tiles_height, tiles_width, top_tile_depth]],
            [ BOX_LID,
                lid_attr,
            ], 
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ (tiles_height)/2-gw2, tiles_width-gw2, top_tile_depth-gw2-gw] ],
                    [ CMP_NUM_COMPARTMENTS_XY, [2, 1] ],
                    [CMP_PEDESTAL_BASE_B, true],
                ]
            ], 
        ]
    ],
    [ "cathedrals_6_x1",
        [ 
            [BOX_SIZE_XYZ, [cat_6_width, cat_46_height, cat_46_depth]],
            [ BOX_LID,
                lid_attr,
            ], 
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ cat_width, cat_height, cat_46_depth-(3+gw2)] ],
                    [ CMP_NUM_COMPARTMENTS_XY, [3, 2] ],
                    [CMP_PEDESTAL_BASE_B, true],
                ]
            ], 
        ]
    ],
    [ "other_tokens_x1",
        [ 
            [BOX_SIZE_XYZ, [cat_6_width, cat_46_height, cat_under_depth]],
            [ BOX_STACKABLE_B, true],
            [ BOX_NO_LID_B, true],  
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ tile_width, cat_46_height-gw2, cat_under_depth-(3+gw2)] ],
                    [ CMP_NUM_COMPARTMENTS_XY, [2, 1] ],
                    [CMP_PEDESTAL_BASE_B, true],
                    [POSITION_XY, [0,0]]
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ cat_6_width- (tile_width+gw2)*2, cat_46_height-gw2, cat_under_depth-(3+gw2)] ],
                    [POSITION_XY, [tile_width*2+gw2,0]]
                ]
            ],             
        ]
    ],
    [ "cathedrals_4_x1",
        [ 
            [BOX_SIZE_XYZ, [cat_4_width, cat_46_height, cat_46_depth]],
            [ BOX_LID,
                lid_attr,
            ], 
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ cat_width, cat_height, cat_46_depth-(2*gw2)] ],
                    [ CMP_NUM_COMPARTMENTS_XY, [2, 1] ],
                    [CMP_PEDESTAL_BASE_B, true],
                    [POSITION_XY, [0,0]]
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ cat_width, cat_height, cat_46_depth-(3+gw2)] ],
                    [CMP_PEDESTAL_BASE_B, true],
                    [POSITION_XY, [0,cat_width+gw]]
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ cat_width, (cat_height-gw)/2, cat_46_depth-(2*gw2)] ],
                    [CMP_PEDESTAL_BASE_B, true],
                    [POSITION_XY, [cat_height,cat_width+gw]]
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ cat_width, (cat_height-gw)/2, cat_46_depth-(2*gw2)] ],
                    [CMP_PEDESTAL_BASE_B, true],
                    [POSITION_XY, [cat_height,cat_width+(cat_height+gw)/2+gw]]
                ]
            ], 
        ],
    ],
    [ "circles_x1",
        [ 
            [BOX_SIZE_XYZ, [cat_4_width, cat_46_height, cat_under_depth]],
            [ BOX_STACKABLE_B, true],
            [ BOX_NO_LID_B, true],  
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ action_wheel_r, action_wheel_r, g_cut] ],
                    [CMP_SHAPE, ROUND],
                    [CMP_SHAPE_VERTICAL_B,                  t],
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ action_wheel_r-5*gw2, action_wheel_r-gw2, cat_under_depth-gw2] ],
                    [CMP_SHAPE, ROUND],
                    [CMP_SHAPE_VERTICAL_B,                  t],
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ cat_4_width-gw2+1, cat_46_height/4-0.5, g_cut] ],
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ cat_4_width/4, cat_46_height-gw2, g_cut] ],
                ]
            ], 
        ]
    ],
    [   "optional_spacer",
        [
            [ BOX_SIZE_XYZ, [spacer_width, spacer_height, spacer_depth] ],
            [ BOX_NO_LID_B, true],  
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ spacer_width-gw2, spacer_height-gw2, spacer_depth -gw ],],
                    [POSITION_XY,                           [0,0]],
                    [ CMP_CUTOUT_BOTTOM_B, true ],
                ]
            ]]]
];


MakeAll();