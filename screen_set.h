#pragma once
//导入图形库
#include <easyx.h>

#include "data.h"

//该库主要处理图形学的自适应问题，以及屏幕分辨率相关问题

//屏幕初始化
void make_screen(vector2 size,int flag = 0)
{
	initgraph((int)size.x, (int)size.y, flag);
}
void draw_solidrectangle(vector2 left_up, vector2 right_down, COLORREF color = WHITE)
{
	setfillcolor(color);
	solidrectangle(left_up.x, left_up.y, right_down.x, right_down.y);
}