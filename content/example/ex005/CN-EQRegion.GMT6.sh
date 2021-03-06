#!/bin/bash

gmt begin CN-EQRegion png

gmt set MAP_GRID_PEN_PRIMARY 0.25p,gray,2_2:1
gmt set FORMAT_GEO_MAP ddd:mm:ssF MAP_FRAME_WIDTH 3p
gmt set FONT_ANNOT_PRIMARY 7p

# 绘制中国地图
gmt coast -JM105/6.5i -R65/145/12/56 -G244/243/239 -S167/194/223 -B10f5g10 -Lg85/17.5+c17.5+w500k+f+u
gmt plot CN-border-La.dat -W0p,gray70

# 绘制地震亚区
gmt plot CN-EQSubRegion.dat -W1p,blue
gmt text CN-EQSubRegion-name.dat -F+f8p,35,blue

# 绘制地震区
gmt plot CN-EQRegion.dat -W1p,red
gmt text CN-EQRegion-name.dat -F+f10p,35,red

# 绘制南海区域
gmt basemap -JM1.1i -R105/123/3/24 -B0 -X5.4i --MAP_FRAME_TYPE=plain --MAP_FRAME_PEN=1p
gmt coast -N1/0.1p -W1/0.25p -G244/243/239 -S167/194/223
gmt plot CN-border-La.dat -W0.25p
echo "南海诸岛" | gmt text -F+f10p,35+cBC -D0c/0.1c -N -Gwhite

gmt end
