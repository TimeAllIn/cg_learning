#pragma once
//����ͼ�ο�
#include <easyx.h>

#include "data.h"

//�ÿ���Ҫ����ͼ��ѧ������Ӧ���⣬�Լ���Ļ�ֱ����������

//��Ļ��ʼ��
void make_screen(vector2 size,int flag = 0)
{
	initgraph((int)size.x, (int)size.y, flag);
}
void draw_solidrectangle(vector2 left_up, vector2 right_down, COLORREF color = WHITE)
{
	setfillcolor(color);
	solidrectangle(left_up.x, left_up.y, right_down.x, right_down.y);
}